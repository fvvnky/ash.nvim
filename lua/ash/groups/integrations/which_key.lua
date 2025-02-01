local p = require("ash.palette")

local function groups()
    return {
        WhichKey = { link = "NormalFloat" },
        WhichKeyBorder = { link = "FloatBorder" },

        WhichKeyGroup = { fg = p.charcoal },
        WhichKeySeparator = { fg = p.overlay0 },
        WhichKeyDesc = { fg = p.ember },
        WhichKeyValue = { fg = p.overlay0 },
    }
end

return groups
