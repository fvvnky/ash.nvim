local p = require("ash.palette")

local function groups()
    return {
        CmpItemAbbr = { fg = p.overlay2 },
        CmpItemAbbrDeprecated = { fg = p.overlay0, style = { "strikethrough" } },
        CmpItemKind = { fg = p.blue },
        CmpItemMenu = { fg = p.text },
        CmpItemAbbrMatch = { fg = p.text, style = { "bold" } },
        CmpItemAbbrMatchFuzzy = { fg = p.text, style = { "bold" } },

        CmpItemKindSnippet = { fg = p.mauve },
        CmpItemKindKeyword = { fg = p.red },
        CmpItemKindText = { fg = p.teal },
        CmpItemKindMethod = { fg = p.blue },
        CmpItemKindConstructor = { fg = p.blue },
        CmpItemKindFunction = { fg = p.blue },
        CmpItemKindFolder = { fg = p.blue },
        CmpItemKindModule = { fg = p.blue },
        CmpItemKindConstant = { fg = p.peach },
        CmpItemKindField = { fg = p.green },
        CmpItemKindProperty = { fg = p.green },
        CmpItemKindEnum = { fg = p.green },
        CmpItemKindUnit = { fg = p.green },
        CmpItemKindClass = { fg = p.yellow },
        CmpItemKindVariable = { fg = p.flamingo },
        CmpItemKindFile = { fg = p.blue },
        CmpItemKindInterface = { fg = p.yellow },
        CmpItemKindColor = { fg = p.red },
        CmpItemKindReference = { fg = p.red },
        CmpItemKindEnumMember = { fg = p.red },
        CmpItemKindStruct = { fg = p.blue },
        CmpItemKindValue = { fg = p.peach },
        CmpItemKindEvent = { fg = p.blue },
        CmpItemKindOperator = { fg = p.blue },
        CmpItemKindTypeParameter = { fg = p.blue },
        CmpItemKindCopilot = { fg = p.teal },
    }
end

return groups
