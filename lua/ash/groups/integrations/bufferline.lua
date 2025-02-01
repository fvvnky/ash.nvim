local p = require("ash.palette")

local function groups(o)
    local bg_highlight = o.transparent and "NONE" or p.crust

    local active_bg = o.transparent and "NONE" or p.base
    local inactive_bg = o.transparent and "NONE" or p.mantle
    local separator_fg = o.transparent and p.surface1 or p.crust
    local styles = o.styles or { "bold", "italic" }

    local highlights = {
        -- Buffers
        background = { bg = inactive_bg },
        buffer_visible = { fg = p.surface1, bg = inactive_bg },
        buffer_selected = { fg = p.text, bg = active_bg, style = styles },

        -- Duplicate
        duplicate_selected = { fg = p.text, bg = active_bg, style = styles },
        duplicate_visible = { fg = p.surface1, bg = inactive_bg, style = styles },
        duplicate = { fg = p.surface1, bg = inactive_bg, style = styles },

        -- Tabs
        tab = { fg = p.surface1, bg = inactive_bg },
        tab_selected = { fg = p.slate, bg = active_bg, bold = true },
        tab_separator = { fg = separator_fg, bg = inactive_bg },
        tab_separator_selected = { fg = separator_fg, bg = active_bg },

        tab_close = { fg = p.crimson, bg = inactive_bg },
        indicator_visible = { fg = p.frost, bg = inactive_bg, style = styles },
        indicator_selected = { fg = p.frost, bg = active_bg, style = styles },

        -- Separators
        separator = { fg = separator_fg, bg = inactive_bg },
        separator_visible = { fg = separator_fg, bg = inactive_bg },
        separator_selected = { fg = separator_fg, bg = active_bg },
        offset_separator = { fg = separator_fg, bg = active_bg },

        -- Close buttons
        close_button = { fg = p.surface1, bg = inactive_bg },
        close_button_visible = { fg = p.surface1, bg = inactive_bg },
        close_button_selected = { fg = p.crimson, bg = active_bg },

        -- Empty fill
        fill = { bg = bg_highlight },

        -- Numbers
        numbers = { fg = p.subtext0, bg = inactive_bg },
        numbers_visible = { fg = p.subtext0, bg = inactive_bg },
        numbers_selected = { fg = p.subtext0, bg = active_bg, style = styles },

        -- Errors
        error = { fg = p.crimson, bg = inactive_bg },
        error_visible = { fg = p.crimson, bg = inactive_bg },
        error_selected = { fg = p.crimson, bg = active_bg, style = styles },
        error_diagnostic = { fg = p.crimson, bg = inactive_bg },
        error_diagnostic_visible = { fg = p.crimson, bg = inactive_bg },
        error_diagnostic_selected = { fg = p.crimson, bg = active_bg },

        -- Warnings
        warning = { fg = p.rust, bg = inactive_bg },
        warning_visible = { fg = p.rust, bg = inactive_bg },
        warning_selected = { fg = p.rust, bg = active_bg, style = styles },
        warning_diagnostic = { fg = p.rust, bg = inactive_bg },
        warning_diagnostic_visible = { fg = p.rust, bg = inactive_bg },
        warning_diagnostic_selected = { fg = p.rust, bg = active_bg },

        -- Infos
        info = { fg = p.slate, bg = inactive_bg },
        info_visible = { fg = p.slate, bg = inactive_bg },
        info_selected = { fg = p.slate, bg = active_bg, style = styles },
        info_diagnostic = { fg = p.slate, bg = inactive_bg },
        info_diagnostic_visible = { fg = p.slate, bg = inactive_bg },
        info_diagnostic_selected = { fg = p.slate, bg = active_bg },

        -- Hint
        hint = { fg = p.tide, bg = inactive_bg },
        hint_visible = { fg = p.tide, bg = inactive_bg },
        hint_selected = { fg = p.tide, bg = active_bg, style = styles },
        hint_diagnostic = { fg = p.tide, bg = inactive_bg },
        hint_diagnostic_visible = { fg = p.tide, bg = inactive_bg },
        hint_diagnostic_selected = { fg = p.tide, bg = active_bg },

        -- Diagnostics
        diagnostic = { fg = p.subtext0, bg = inactive_bg },
        diagnostic_visible = { fg = p.subtext0, bg = inactive_bg },
        diagnostic_selected = { fg = p.subtext0, bg = active_bg, style = styles },

        -- Modified
        modified = { fg = p.frost, bg = inactive_bg },
        modified_visible = { fg = p.frost, bg = inactive_bg },
        modified_selected = { fg = p.frost, bg = active_bg },
    }

    return highlights
end

return groups
