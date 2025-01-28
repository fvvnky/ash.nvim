local p = require("ash.palette")

local function groups(o)
    return {
        TelescopeBorder = { link = "FloatBorder" },
        TelescopeSelectionCaret = { fg = p.flamingo },
        TelescopeSelection = {
            fg = o.transparent and p.flamingo or p.text,
            bg = o.transparent and p.none or p.surface0,
            style = { "bold" },
        },
        TelescopeMatching = { fg = p.blue },
    }
end

return groups
