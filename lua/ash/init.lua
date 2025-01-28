local compiler = require("ash.lib.compiler")
local default_opts = require("ash.options")
local hasher = require("ash.lib.hasher")
local path = require("ash.utils.path")

local did_setup = false
local opts = default_opts

local function setup(cfg)
    did_setup = true
    if cfg then
        opts = vim.tbl_deep_extend("keep", cfg, default_opts)
    end

    local cached_path = opts.compile_path .. path.sep .. "cached"
    local file = io.open(cached_path)
    local cached = nil
    if file then
        cached = file:read()
        file:close()
    end

    local git_path = debug.getinfo(1).source:sub(2, -24) .. ".git"
    local git = vim.fn.getftime(git_path)
    local hash = hasher.hash(cfg)
        .. (git == -1 and git_path or git)
        .. (vim.o.winblend == 0 and 1 or 0)
        .. (vim.o.pumblend == 0 and 1 or 0)

    if cached ~= hash then
        compiler.compile(opts)
        file = io.open(cached_path, "wb")
        if file then
            file:write(hash)
            file:close()
        end
    end
end

local function load()
    if not did_setup then
        setup()
    end

    local compiled_path = opts.compile_path .. path.sep .. "ash_compiled"
    local f = loadfile(compiled_path)
    if not f then
        compiler.compile(opts)
        f = assert(loadfile(compiled_path), "failed to load cache")
    end
    f()
end

vim.api.nvim_create_user_command("Ash", function()
    vim.api.nvim_command("colorscheme ash")
end, {})

vim.api.nvim_create_user_command("AshCompile", function()
    for name, _ in pairs(package.loaded) do
        if name:match("^ash.") then
            package.loaded[name] = nil
        end
    end
    compiler.compile(opts)
    vim.notify("Ash (info): compiled cache!", vim.log.levels.INFO)
    vim.cmd.colorscheme("ash")
end, {})

if vim.g.ash_debug then
    vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*/ash/*",
        callback = function()
            vim.schedule(function()
                vim.cmd("AshCompile")
            end)
        end,
    })
end

return {
    setup = setup,
    load = load,
    opts = opts,
}
