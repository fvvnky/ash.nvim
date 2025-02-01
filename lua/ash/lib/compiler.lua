local groups = require("ash.groups")
local p = require("ash.palette")
local path = require("ash.utils.path")

-- local bufferline_ok, _ = pcall(require, "bufferline")
local cmp_ok, _ = pcall(require, "cmp")
local dap_ok, _ = pcall(require, "dap")
local fzf_ok, _ = pcall(require, "fzf-lua")
local lspsaga_ok, _ = pcall(require, "lspsaga")
local noice_ok, _ = pcall(require, "noice")
local nvimtree_ok, _ = pcall(require, "nvim-tree")
local render_markdown_ok, _ = pcall(require, "render-markdown")
local telescope_ok, _ = pcall(require, "telescope")
local treesitter_ok, _ = pcall(require, "nvim-treesitter")
local treesitter_context_ok, _ = pcall(require, "treesitter-context")
local which_key_ok, _ = pcall(require, "which-key")

local function inspect(t)
    local list = {}
    for k, v in pairs(t) do
        local tv = type(v)
        if tv == "string" then
            table.insert(list, string.format([[%s = "%s"]], k, v))
        elseif tv == "table" then
            table.insert(list, string.format([[%s = %s]], k, inspect(v)))
        else
            table.insert(list, string.format([[%s = %s]], k, tostring(v)))
        end
    end
    return string.format([[{ %s }]], table.concat(list, ", "))
end

local function compile(o)
    local lines = {
        [[
return string.dump(function()
vim.o.termguicolors = true
if vim.g.colors_name then vim.cmd("hi clear") end
vim.o.background = "dark"
vim.g.colors_name = "ash"
local h = vim.api.nvim_set_hl]],
    }
    if path.sep == "\\" then
        o.compile_path = o.compile_path:gsub("/", "\\")
    end

    local highlights = type(o.highlights) == "function" and o.highlights(p) or o.highlights or {}
    local tbl = vim.tbl_deep_extend("keep", highlights, groups.editor(o), groups.syntax(o))
    tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.lsp(o))

    -- integrations
    if treesitter_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.treesitter(o))
    end
    if treesitter_context_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.treesitter_context(o))
    end
    if cmp_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.cmp())
    end
    if telescope_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.telescope(o))
    end
    if which_key_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.which_key())
    end
    if fzf_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.fzf())
    end
    if noice_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.noice(o))
    end
    -- if bufferline_ok then
    --     tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.bufferline(o))
    -- end
    if nvimtree_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.nvimtree(o))
    end
    if render_markdown_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.render_markdown(o))
    end
    if dap_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.dap())
    end
    if lspsaga_ok then
        tbl = vim.tbl_deep_extend("keep", tbl, groups.integrations.lspsaga(o))
    end

    if o.term_colors == true then
        for k, v in pairs(groups.terminal()) do
            table.insert(lines, string.format('vim.g.%s = "%s"', k, v))
        end
    end

    for group, color in pairs(tbl) do
        if color.style then
            for _, style in pairs(color.style) do
                color[style] = true
                if o.no_italic and style == "italic" then
                    color[style] = false
                end
                if o.no_bold and style == "bold" then
                    color[style] = false
                end
                if o.no_underline and style == "underline" then
                    color[style] = false
                end
            end
        end
        color.style = nil
        table.insert(lines, string.format([[h(0, "%s", %s)]], group, inspect(color)))
    end
    table.insert(lines, "end, true)")
    if vim.fn.isdirectory(o.compile_path) == 0 then
        vim.fn.mkdir(o.compile_path, "p")
    end

    if vim.g.ash_debug then
        local deb = io.open(o.compile_path .. path.sep .. "debug.lua", "wb")
        if deb then
            deb:write(table.concat(lines, "\n"))
            deb:close()
        end
    end

    local f = load(table.concat(lines, "\n"))
    if not f then
        local err_path = (path.sep == "/" and "/tmp" or os.getenv("TMP")) .. "/ash_error.lua"
        print(string.format(
            [[Ash (error): Error compiling theme
You can open %s for debugging
If you think this is a bug, please open an issue and attach %s file
Capture:
]],
            err_path,
            err_path
        ))
        local err = io.open(err_path, "wb")
        if err then
            err:write(table.concat(lines, "\n"))
            err:close()
        end
        dofile(err_path)
        return
    end

    local file = assert(
        io.open(o.compile_path .. path.sep .. "ash_compiled", "wb"),
        "Permission denied while writing compiled file to " .. o.compile_path
    )
    file:write(f())
    file:close()
end

return {
    compile = compile,
}
