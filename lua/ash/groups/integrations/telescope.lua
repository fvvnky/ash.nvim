local p = require("ash.palette")

local function groups(o)
    return {
        TelescopeBorder = { link = "FloatBorder" },
        TelescopeSelectionCaret = { fg = p.rose },
        TelescopeSelection = {
            fg = o.transparent and p.rose or p.text,
            bg = o.transparent and p.none or p.surface0,
            style = { "bold" },
        },
        TelescopeMatching = { fg = p.charcoal },
    }
end

return groups
