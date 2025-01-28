local p = require("ash.palette")

local function groups(o)
    return o.transparent
            and {
                TreesitterContextBottom = { sp = p.dim, style = { "underline" } },
                TreesitterContextLineNumber = { fg = p.rosewater },
            }
        or {
            TreesitterContextBottom = {
                sp = p.surface0,
                style = { "underline" },
            },
            TreesitterContextLineNumber = {
                fg = p.surface1,
                bg = p.mantle,
            },
        }
end

return groups
