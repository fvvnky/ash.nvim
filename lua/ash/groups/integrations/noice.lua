local c = require("ash.utils.color")
local p = require("ash.palette")

local function groups(o)
    return {
        NoiceCmdline = { fg = p.text },
        NoiceCmdlineIcon = { fg = p.sky },
        NoiceCmdlineIconSearch = { fg = p.yellow },
        NoiceCmdlinePopupBorder = { fg = p.lavender },
        NoiceCmdlinePopupBorderSearch = { fg = p.yellow },
        NoiceConfirmBorder = { fg = p.blue },
        NoiceMini = { fg = p.subtext0, blend = 0 },
        NoiceFormatProgressDone = {
            bg = o.transparent and p.none or c.darken(p.sky, 0.30, p.base),
            fg = p.subtext0,
        },
        NoiceFormatProgressTodo = {
            bg = o.transparent and p.none or c.darken(p.surface0, 0.64, p.base),
            fg = p.subtext0,
        },
    }
end

return groups
