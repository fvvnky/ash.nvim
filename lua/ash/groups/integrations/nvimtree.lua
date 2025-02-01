local p = require("ash.palette")

local function groups(o)
    return {
        NvimTreeFolderName = { fg = p.charcoal },
        NvimTreeFolderIcon = { fg = p.charcoal },
        NvimTreeNormal = { fg = p.text, bg = o.transparent and p.none or p.mantle },
        NvimTreeOpenedFolderName = { fg = p.charcoal },
        NvimTreeEmptyFolderName = { fg = p.charcoal },
        NvimTreeIndentMarker = { fg = p.overlay0 },
        NvimTreeWinSeparator = {
            fg = o.transparent and p.surface1 or p.base,
            bg = o.transparent and p.none or p.base,
        },
        NvimTreeRootFolder = { fg = p.fog, style = { "bold" } },
        NvimTreeSymlink = { fg = p.ember },
        NvimTreeStatuslineNc = { fg = p.mantle, bg = p.mantle },
        NvimTreeGitDirty = { fg = p.rust },
        NvimTreeGitNew = { fg = p.charcoal },
        NvimTreeGitDeleted = { fg = p.crimson },
        NvimTreeSpecialFile = { fg = p.rose },
        NvimTreeImageFile = { fg = p.text },
        NvimTreeOpenedFile = { fg = p.ember },
    }
end

return groups
