local c = require("ash.utils.color")
local p = require("ash.palette")

local function groups(o)
    return {
        Comment = { fg = p.overlay2, style = o.styles.comments },
        SpecialComment = { link = "Special" },
        Constant = { fg = p.tide },
        String = { fg = p.sage, style = o.styles.strings or {} },
        Character = { fg = p.tide },
        Number = { fg = p.tide, style = o.styles.numbers or {} },
        Float = { link = "Number" },
        Boolean = { fg = p.tide, style = o.styles.booleans or {} },
        Identifier = { fg = p.rose, style = o.styles.variables or {} },
        Function = { fg = p.subtext0, style = o.styles.functions or {} },
        Statement = { fg = p.seafoam },
        Conditional = { fg = p.seafoam, style = o.styles.conditionals or {} },
        Repeat = { fg = p.seafoam, style = o.styles.loops or {} },
        Label = { fg = p.purple },
        Operator = { fg = p.fog, style = o.styles.operators or {} },
        Keyword = { fg = p.text, style = o.styles.keywords or {} },
        Exception = { fg = p.seafoam, style = o.styles.keywords or {} },

        PreProc = { fg = p.ember },
        Include = { fg = p.seafoam, style = o.styles.keywords or {} },
        Define = { link = "PreProc" },
        Macro = { fg = p.seafoam },
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
        qfFileName = { fg = p.subtext0 },
        htmlH1 = { fg = p.ember, style = { "bold" } },
        htmlH2 = { fg = p.subtext0, style = { "bold" } },
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
        diffChanged = { fg = p.subtext0 },
        diffOldFile = { fg = p.crimson },
        diffNewFile = { fg = p.tide },
        diffFile = { fg = p.subtext0 },
        diffLine = { fg = p.overlay0 },
        diffIndexLine = { fg = p.tide },
        DiffAdd = { bg = c.darken(p.sage, 0.18, p.base) },
        DiffChange = { bg = c.darken(p.subtext0, 0.07, p.base) },
        DiffDelete = { bg = c.darken(p.crimson, 0.18, p.base) },
        DiffText = { bg = c.darken(p.subtext0, 0.30, p.base) },

        -- nvim
        healthError = { fg = p.crimson },
        healthSuccess = { fg = p.sage },
        healthWarning = { fg = p.ember },

        -- glyphs
        GlyphPalette1 = { fg = p.crimson },
        GlyphPalette2 = { fg = p.tide },
        GlyphPalette3 = { fg = p.crimson },
        GlyphPalette4 = { fg = p.subtext0 },
        GlyphPalette6 = { fg = p.tide },
        GlyphPalette7 = { fg = p.text },
        GlyphPalette9 = { fg = p.crimson },

        -- rainbow
        rainbow1 = { fg = p.crimson },
        rainbow2 = { fg = p.tide },
        rainbow3 = { fg = p.crimson },
        rainbow4 = { fg = p.sage },
        rainbow5 = { fg = p.purple },
        rainbow6 = { fg = p.fog },

        -- csv
        csvCol0 = { fg = p.crimson },
        csvCol1 = { fg = p.tide },
        csvCol2 = { fg = p.crimson },
        csvCol3 = { fg = p.sage },
        csvCol4 = { fg = p.sage },
        csvCol5 = { fg = p.subtext0 },
        csvCol6 = { fg = p.fog },
        csvCol7 = { fg = p.seafoam },
        csvCol8 = { fg = p.ember },
    }
end

return groups
