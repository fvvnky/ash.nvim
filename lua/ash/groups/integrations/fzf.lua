local p = require("ash.palette")

local function groups()
    return {
        FzfLuaBorder = { link = "FloatBorder" },
        FzfLuaTitle = { link = "FloatBorder" },
        FzfLuaHeaderBind = { fg = p.yellow },
        FzfLuaHeaderText = { fg = p.peach },
        FzfLuaDirPart = { link = "NonText" },
        FzfLuaFzfMatch = { fg = p.blue },
        FzfLuaFzfPrompt = { fg = p.blue },
        FzfLuaPathColNr = { fg = p.blue },
        FzfLuaPathLineNr = { fg = p.green },
        FzfLuaBufName = { fg = p.mauve },
        FzfLuaBufNr = { fg = p.yellow },
        FzfLuaBufFlagCur = { fg = p.peach },
        FzfLuaBufFlagAlt = { fg = p.blue },
        FzfLuaTabTitle = { fg = p.sky },
        FzfLuaTabMarker = { fg = p.yellow },
        FzfLuaLiveSym = { fg = p.peach },
    }
end

return groups
