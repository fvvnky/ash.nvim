local c = require("ash.utils.color")
local p = require("ash.palette")

local function groups(o)
    return {
        NoiceCmdline = { fg = p.text },
        NoiceCmdlineIcon = { fg = p.slate },
        NoiceCmdlineIconSearch = { fg = p.crimson },
        NoiceCmdlinePopupBorder = { fg = p.fog },
        NoiceCmdlinePopupBorderSearch = { fg = p.crimson },
        NoiceConfirmBorder = { fg = p.charcoal },
        NoiceMini = { fg = p.subtext0, blend = 0 },
        NoiceFormatProgressDone = {
            bg = o.transparent and p.none or c.darken(p.slate, 0.30, p.base),
            fg = p.subtext0,
        },
        NoiceFormatProgressTodo = {
            bg = o.transparent and p.none or c.darken(p.surface0, 0.64, p.base),
            fg = p.subtext0,
        },
    }
end

return groups
