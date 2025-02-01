local p = require("ash.palette")

local function groups()
    return {
        CmpItemAbbr = { fg = p.overlay2 },
        CmpItemAbbrDeprecated = { fg = p.overlay0, style = { "strikethrough" } },
        CmpItemKind = { fg = p.charcoal },
        CmpItemMenu = { fg = p.text },
        CmpItemAbbrMatch = { fg = p.text, style = { "bold" } },
        CmpItemAbbrMatchFuzzy = { fg = p.text, style = { "bold" } },

        CmpItemKindSnippet = { fg = p.storm },
        CmpItemKindKeyword = { fg = p.crimson },
        CmpItemKindText = { fg = p.tide },
        CmpItemKindMethod = { fg = p.charcoal },
        CmpItemKindConstructor = { fg = p.charcoal },
        CmpItemKindFunction = { fg = p.charcoal },
        CmpItemKindFolder = { fg = p.charcoal },
        CmpItemKindModule = { fg = p.charcoal },
        CmpItemKindConstant = { fg = p.frost },
        CmpItemKindField = { fg = p.sage },
        CmpItemKindProperty = { fg = p.sage },
        CmpItemKindEnum = { fg = p.sage },
        CmpItemKindUnit = { fg = p.sage },
        CmpItemKindClass = { fg = p.crimson },
        CmpItemKindVariable = { fg = p.rose },
        CmpItemKindFile = { fg = p.charcoal },
        CmpItemKindInterface = { fg = p.crimson },
        CmpItemKindColor = { fg = p.crimson },
        CmpItemKindReference = { fg = p.crimson },
        CmpItemKindEnumMember = { fg = p.crimson },
        CmpItemKindStruct = { fg = p.charcoal },
        CmpItemKindValue = { fg = p.frost },
        CmpItemKindEvent = { fg = p.charcoal },
        CmpItemKindOperator = { fg = p.charcoal },
        CmpItemKindTypeParameter = { fg = p.charcoal },
        CmpItemKindCopilot = { fg = p.tide },
    }
end

return groups
