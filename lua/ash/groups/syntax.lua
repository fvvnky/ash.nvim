local c = require("ash.utils.color")
local p = require("ash.palette")

local function groups(o)
    return {
        Comment = { fg = p.overlay2, style = o.styles.comments },
        SpecialComment = { link = "Special" },
        Constant = { fg = p.frost },
        String = { fg = p.sage, style = o.styles.strings or {} },
        Character = { fg = p.tide },
        Number = { fg = p.frost, style = o.styles.numbers or {} },
        Float = { link = "Number" },
        Boolean = { fg = p.frost, style = o.styles.booleans or {} },
        Identifier = { fg = p.rose, style = o.styles.variables or {} },
        Function = { fg = p.charcoal, style = o.styles.functions or {} },
        Statement = { fg = p.storm },
        Conditional = { fg = p.storm, style = o.styles.conditionals or {} },
        Repeat = { fg = p.storm, style = o.styles.loops or {} },
        Label = { fg = p.drift },
        Operator = { fg = p.slate, style = o.styles.operators or {} },
        Keyword = { fg = p.storm, style = o.styles.keywords or {} },
        Exception = { fg = p.storm, style = o.styles.keywords or {} },

        PreProc = { fg = p.ember },
        Include = { fg = p.storm, style = o.styles.keywords or {} },
        Define = { link = "PreProc" },
        Macro = { fg = p.storm },
        PreCondit = { link = "PreProc" },

        StorageClass = { fg = p.crimson },
        Structure = { fg = p.crimson },
        Special = { fg = p.ember },
        Type = { fg = p.crimson, style = o.styles.types or {} },
        Typedef = { link = "Type" },
        SpecialChar = { link = "Special" },
        Tag = { fg = p.fog, style = { "bold" } },
        Delimiter = { fg = p.overlay2 },
        Debug = { link = "Special" },

        Underlined = { style = { "underline" } },
        Bold = { style = { "bold" } },
        Italic = { style = { "italic" } },

        Error = { fg = p.crimson },
        Todo = { bg = p.rose, fg = p.base, style = { "bold" } },
        qfLineNr = { fg = p.crimson },
        qfFileName = { fg = p.charcoal },
        htmlH1 = { fg = p.ember, style = { "bold" } },
        htmlH2 = { fg = p.charcoal, style = { "bold" } },
        mkdCodeDelimiter = { bg = p.base, fg = p.text },
        mkdCodeStart = { fg = p.rose, style = { "bold" } },
        mkdCodeEnd = { fg = p.rose, style = { "bold" } },

        -- debugging
        debugPC = { bg = o.transparent and p.none or p.crust },
        debugBreakpoint = { bg = p.base, fg = p.overlay0 },

        -- illuminate
        illuminatedWord = { bg = p.surface1 },
        illuminatedCurWord = { bg = p.surface1 },

        -- diff
        diffAdded = { fg = p.sage },
        diffRemoved = { fg = p.crimson },
        diffChanged = { fg = p.charcoal },
        diffOldFile = { fg = p.crimson },
        diffNewFile = { fg = p.frost },
        diffFile = { fg = p.charcoal },
        diffLine = { fg = p.overlay0 },
        diffIndexLine = { fg = p.tide },
        DiffAdd = { bg = c.darken(p.sage, 0.18, p.base) },
        DiffChange = { bg = c.darken(p.charcoal, 0.07, p.base) },
        DiffDelete = { bg = c.darken(p.crimson, 0.18, p.base) },
        DiffText = { bg = c.darken(p.charcoal, 0.30, p.base) },

        -- nvim
        healthError = { fg = p.crimson },
        healthSuccess = { fg = p.tide },
        healthWarning = { fg = p.crimson },

        -- glyphs
        GlyphPalette1 = { fg = p.crimson },
        GlyphPalette2 = { fg = p.tide },
        GlyphPalette3 = { fg = p.crimson },
        GlyphPalette4 = { fg = p.charcoal },
        GlyphPalette6 = { fg = p.tide },
        GlyphPalette7 = { fg = p.text },
        GlyphPalette9 = { fg = p.crimson },

        -- rainbow
        rainbow1 = { fg = p.crimson },
        rainbow2 = { fg = p.frost },
        rainbow3 = { fg = p.crimson },
        rainbow4 = { fg = p.sage },
        rainbow5 = { fg = p.drift },
        rainbow6 = { fg = p.fog },

        -- csv
        csvCol0 = { fg = p.crimson },
        csvCol1 = { fg = p.frost },
        csvCol2 = { fg = p.crimson },
        csvCol3 = { fg = p.sage },
        csvCol4 = { fg = p.slate },
        csvCol5 = { fg = p.charcoal },
        csvCol6 = { fg = p.fog },
        csvCol7 = { fg = p.storm },
        csvCol8 = { fg = p.ember },
    }
end

return groups
