local p = require("ash.palette")

local function groups(o)
    return {
        NvimTreeFolderName = { fg = p.blue },
        NvimTreeFolderIcon = { fg = p.blue },
        NvimTreeNormal = { fg = p.text, bg = o.transparent and p.none or p.mantle },
        NvimTreeOpenedFolderName = { fg = p.blue },
        NvimTreeEmptyFolderName = { fg = p.blue },
        NvimTreeIndentMarker = { fg = p.overlay0 },
        NvimTreeWinSeparator = {
            fg = o.transparent and p.surface1 or p.base,
            bg = o.transparent and p.none or p.base,
        },
        NvimTreeRootFolder = { fg = p.lavender, style = { "bold" } },
        NvimTreeSymlink = { fg = p.pink },
        NvimTreeStatuslineNc = { fg = p.mantle, bg = p.mantle },
        NvimTreeGitDirty = { fg = p.yellow },
        NvimTreeGitNew = { fg = p.blue },
        NvimTreeGitDeleted = { fg = p.red },
        NvimTreeSpecialFile = { fg = p.flamingo },
        NvimTreeImageFile = { fg = p.text },
        NvimTreeOpenedFile = { fg = p.pink },
    }
end

return groups
