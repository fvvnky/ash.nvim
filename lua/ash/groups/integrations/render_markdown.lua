local c = require("ash.utils.color")
local p = require("ash.palette")

local function groups(o)
    local hl = {
        RenderMarkdownCode = { bg = p.mantle },
        RenderMarkdownpodeInline = { bg = p.surface0 },
        RenderMarkdownBullet = { fg = p.sky },
        RenderMarkdownTableHead = { fg = p.blue },
        RenderMarkdownTableRow = { fg = p.lavender },
        RenderMarkdownSuccess = { fg = p.green },
        RenderMarkdownInfo = { fg = p.sky },
        RenderMarkdownHint = { fg = p.teal },
        RenderMarkdownWarn = { fg = p.yellow },
        RenderMarkdownError = { fg = p.red },
    }

    local syntax = require("ash.groups.syntax")(o)
    local base = not o.transparent and p.base or nil

    for i = 1, 6 do
        local color = syntax["rainbow" .. i].fg
        hl["RenderMarkdownH" .. i] = { fg = color }
        hl["RenderMarkdownH" .. i .. "Bg"] = { bg = c.darken(color, 0.30, base) }
    end

    return hl
end

return groups
