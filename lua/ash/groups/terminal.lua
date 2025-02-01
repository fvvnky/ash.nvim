local p = require("ash.palette")

local function groups()
    return {
        terminal_color_0 = p.overlay0,
        terminal_color_8 = p.overlay1,

        terminal_color_1 = p.crimson,
        terminal_color_9 = p.crimson,

        terminal_color_2 = p.sage,
        terminal_color_10 = p.sage,

        terminal_color_3 = p.crimson,
        terminal_color_11 = p.crimson,

        terminal_color_4 = p.charcoal,
        terminal_color_12 = p.charcoal,

        terminal_color_5 = p.ember,
        terminal_color_13 = p.ember,

        terminal_color_6 = p.slate,
        terminal_color_14 = p.slate,

        terminal_color_7 = p.text,
        terminal_color_15 = p.text,
    }
end

return groups
