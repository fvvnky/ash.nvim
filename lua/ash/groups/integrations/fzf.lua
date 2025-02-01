local p = require("ash.palette")

local function groups()
    return {
        FzfLuaBorder = { link = "FloatBorder" },
        FzfLuaTitle = { link = "FloatBorder" },
        FzfLuaHeaderBind = { fg = p.crimson },
        FzfLuaHeaderText = { fg = p.frost },
        FzfLuaDirPart = { link = "NonText" },
        FzfLuaFzfMatch = { fg = p.charcoal },
        FzfLuaFzfPrompt = { fg = p.charcoal },
        FzfLuaPathColNr = { fg = p.charcoal },
        FzfLuaPathLineNr = { fg = p.sage },
        FzfLuaBufName = { fg = p.storm },
        FzfLuaBufNr = { fg = p.crimson },
        FzfLuaBufFlagCur = { fg = p.frost },
        FzfLuaBufFlagAlt = { fg = p.charcoal },
        FzfLuaTabTitle = { fg = p.slate },
        FzfLuaTabMarker = { fg = p.crimson },
        FzfLuaLiveSym = { fg = p.frost },
    }
end

return groups
