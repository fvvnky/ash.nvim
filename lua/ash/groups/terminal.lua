local p = require("ash.palette")

local function groups()
    return {
        terminal_color_0 = p.overlay0,
        terminal_color_8 = p.overlay1,

        terminal_color_1 = p.red,
        terminal_color_9 = p.red,

        terminal_color_2 = p.green,
        terminal_color_10 = p.green,

        terminal_color_3 = p.yellow,
        terminal_color_11 = p.yellow,

        terminal_color_4 = p.blue,
        terminal_color_12 = p.blue,

        terminal_color_5 = p.pink,
        terminal_color_13 = p.pink,

        terminal_color_6 = p.sky,
        terminal_color_14 = p.sky,

        terminal_color_7 = p.text,
        terminal_color_15 = p.text,
    }
end

return groups
