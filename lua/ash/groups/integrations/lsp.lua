local c = require("ash.utils.color")
local p = require("ash.palette")

local function groups(o)
    local error = p.crimson
    local warning = p.rust
    local info = p.slate
    local hint = p.tide
    local ok = p.sage
    local darken_pct = 0.095

    return {
        LspReferenceText = { bg = p.surface1 },
        LspReferenceRead = { bg = p.surface1 },
        LspReferenceWrite = { bg = p.surface1 },

        DiagnosticVirtualTextError = {
            bg = o.transparent and p.none or c.darken(error, darken_pct, p.base),
            fg = error,
        },
        DiagnosticVirtualTextWarn = {
            bg = o.transparent and p.none or c.darken(warning, darken_pct, p.base),
            fg = warning,
        },
        DiagnosticVirtualTextInfo = {
            bg = o.transparent and p.none or c.darken(info, darken_pct, p.base),
            fg = info,
        },
        DiagnosticVirtualTextHint = {
            bg = o.transparent and p.none or c.darken(hint, darken_pct, p.base),
            fg = hint,
        },
        DiagnosticVirtualTextOk = {
            bg = o.transparent and p.none or c.darken(hint, darken_pct, p.base),
            fg = ok,
        },

        DiagnosticError = { bg = p.none, fg = error },
        DiagnosticWarn = { bg = p.none, fg = warning },
        DiagnosticInfo = { bg = p.none, fg = info },
        DiagnosticHint = { bg = p.none, fg = hint },
        DiagnosticOk = { bg = p.none, fg = ok },

        DiagnosticUnderlineError = { sp = error },
        DiagnosticUnderlineWarn = { sp = warning },
        DiagnosticUnderlineInfo = { sp = info },
        DiagnosticUnderlineHint = { sp = hint },
        DiagnosticUnderlineOk = { sp = ok },

        DiagnosticFloatingError = { fg = error },
        DiagnosticFloatingWarn = { fg = warning },
        DiagnosticFloatingInfo = { fg = info },
        DiagnosticFloatingHint = { fg = hint },
        DiagnosticFloatingOk = { fg = ok },

        DiagnosticSignError = { fg = error },
        DiagnosticSignWarn = { fg = warning },
        DiagnosticSignInfo = { fg = info },
        DiagnosticSignHint = { fg = hint },
        DiagnosticSignOk = { fg = ok },

        LspDiagnosticsDefaultError = { fg = error },
        LspDiagnosticsDefaultWarning = { fg = warning },
        LspDiagnosticsDefaultInformation = { fg = info },
        LspDiagnosticsDefaultHint = { fg = hint },
        LspSignatureActiveParameter = { bg = p.surface0, style = { "bold" } },

        LspDiagnosticsError = { fg = error },
        LspDiagnosticsWarning = { fg = warning },
        LspDiagnosticsInformation = { fg = info },
        LspDiagnosticsHint = { fg = hint },
        LspDiagnosticsVirtualTextError = { fg = error },
        LspDiagnosticsVirtualTextWarning = { fg = warning },
        LspDiagnosticsVirtualTextInformation = { fg = info },
        LspDiagnosticsVirtualTextHint = { fg = hint },
        LspDiagnosticsUnderlineError = { sp = error },
        LspDiagnosticsUnderlineWarning = { sp = warning },
        LspDiagnosticsUnderlineInformation = { sp = info },
        LspDiagnosticsUnderlineHint = { sp = hint },
        LspCodeLens = { fg = p.overlay0 },
        LspCodeLensSeparator = { link = "LspCodeLens" },
        LspInlayHint = {
            fg = p.overlay0,
            bg = o.transparent and p.none or c.darken(p.surface0, 0.64, p.base),
        },
        LspInfoBorder = { link = "FloatBorder" },
    }
end

return groups
