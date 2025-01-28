local c = require("ash.utils.color")
local p = require("ash.palette")

local function groups(o)
    return {
        Comment = { fg = p.overlay2, style = o.styles.comments },
        SpecialComment = { link = "Special" },
        Constant = { fg = p.peach },
        String = { fg = p.green, style = o.styles.strings or {} },
        Character = { fg = p.teal },
        Number = { fg = p.peach, style = o.styles.numbers or {} },
        Float = { link = "Number" },
        Boolean = { fg = p.peach, style = o.styles.booleans or {} },
        Identifier = { fg = p.flamingo, style = o.styles.variables or {} },
        Function = { fg = p.blue, style = o.styles.functions or {} },
        Statement = { fg = p.mauve },
        Conditional = { fg = p.mauve, style = o.styles.conditionals or {} },
        Repeat = { fg = p.mauve, style = o.styles.loops or {} },
        Label = { fg = p.sapphire },
        Operator = { fg = p.sky, style = o.styles.operators or {} },
        Keyword = { fg = p.mauve, style = o.styles.keywords or {} },
        Exception = { fg = p.mauve, style = o.styles.keywords or {} },

        PreProc = { fg = p.pink },
        Include = { fg = p.mauve, style = o.styles.keywords or {} },
        Define = { link = "PreProc" },
        Macro = { fg = p.mauve },
        PreCondit = { link = "PreProc" },

        StorageClass = { fg = p.yellow },
        Structure = { fg = p.yellow },
        Special = { fg = p.pink },
        Type = { fg = p.yellow, style = o.styles.types or {} },
        Typedef = { link = "Type" },
        SpecialChar = { link = "Special" },
        Tag = { fg = p.lavender, style = { "bold" } },
        Delimiter = { fg = p.overlay2 },
        Debug = { link = "Special" },

        Underlined = { style = { "underline" } },
        Bold = { style = { "bold" } },
        Italic = { style = { "italic" } },

        Error = { fg = p.red },
        Todo = { bg = p.flamingo, fg = p.base, style = { "bold" } },
        qfLineNr = { fg = p.yellow },
        qfFileName = { fg = p.blue },
        htmlH1 = { fg = p.pink, style = { "bold" } },
        htmlH2 = { fg = p.blue, style = { "bold" } },
        mkdCodeDelimiter = { bg = p.base, fg = p.text },
        mkdCodeStart = { fg = p.flamingo, style = { "bold" } },
        mkdCodeEnd = { fg = p.flamingo, style = { "bold" } },

        -- debugging
        debugPC = { bg = o.transparent and p.none or p.crust },
        debugBreakpoint = { bg = p.base, fg = p.overlay0 },

        -- illuminate
        illuminatedWord = { bg = p.surface1 },
        illuminatedCurWord = { bg = p.surface1 },

        -- diff
        diffAdded = { fg = p.green },
        diffRemoved = { fg = p.red },
        diffChanged = { fg = p.blue },
        diffOldFile = { fg = p.yellow },
        diffNewFile = { fg = p.peach },
        diffFile = { fg = p.blue },
        diffLine = { fg = p.overlay0 },
        diffIndexLine = { fg = p.teal },
        DiffAdd = { bg = c.darken(p.green, 0.18, p.base) },
        DiffChange = { bg = c.darken(p.blue, 0.07, p.base) },
        DiffDelete = { bg = c.darken(p.red, 0.18, p.base) },
        DiffText = { bg = c.darken(p.blue, 0.30, p.base) },

        -- nvim
        healthError = { fg = p.red },
        healthSuccess = { fg = p.teal },
        healthWarning = { fg = p.yellow },

        -- glyphs
        GlyphPalette1 = { fg = p.red },
        GlyphPalette2 = { fg = p.teal },
        GlyphPalette3 = { fg = p.yellow },
        GlyphPalette4 = { fg = p.blue },
        GlyphPalette6 = { fg = p.teal },
        GlyphPalette7 = { fg = p.text },
        GlyphPalette9 = { fg = p.red },

        -- rainbow
        rainbow1 = { fg = p.red },
        rainbow2 = { fg = p.peach },
        rainbow3 = { fg = p.yellow },
        rainbow4 = { fg = p.green },
        rainbow5 = { fg = p.sapphire },
        rainbow6 = { fg = p.lavender },

        -- csv
        csvCol0 = { fg = p.red },
        csvCol1 = { fg = p.peach },
        csvCol2 = { fg = p.yellow },
        csvCol3 = { fg = p.green },
        csvCol4 = { fg = p.sky },
        csvCol5 = { fg = p.blue },
        csvCol6 = { fg = p.lavender },
        csvCol7 = { fg = p.mauve },
        csvCol8 = { fg = p.pink },
    }
end

return groups
