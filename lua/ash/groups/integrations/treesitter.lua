local p = require("ash.palette")

local function groups(o)
    if vim.treesitter.highlighter.hl_map then
        vim.notify_once(
            [[Ash (info):
nvim-treesitter integration requires neovim 0.8
]],
            vim.log.levels.INFO
        )
        return {}
    end

    -- Reference: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md
    local colors = {
        -- Identifiers
        ["@variable"] = { fg = p.text, style = o.styles.variables or {} },
        ["@variable.builtin"] = { fg = p.red, style = o.styles.properties or {} },
        ["@variable.parameter"] = { fg = p.maroon, style = o.styles.variables or {} },
        ["@variable.member"] = { fg = p.lavender },

        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { fg = p.peach, style = o.styles.keywords or {} },
        ["@constant.macro"] = { link = "Macro" },

        ["@module"] = { fg = p.lavender, style = o.styles.miscs or { "italic" } },
        ["@label"] = { link = "Label" },

        -- Literals
        ["@string"] = { link = "String" },
        ["@string.documentation"] = { fg = p.teal, style = o.styles.strings or {} },
        ["@string.regexp"] = { fg = p.peach, style = o.styles.strings or {} },
        ["@string.escape"] = { fg = p.pink, style = o.styles.strings or {} },
        ["@string.special"] = { link = "Special" },
        ["@string.special.path"] = { link = "Special" },
        ["@string.special.symbol"] = { fg = p.flamingo },
        ["@string.special.url"] = { fg = p.rosewater, style = { "italic", "underline" } },

        ["@character"] = { link = "Character" },
        ["@character.special"] = { link = "SpecialChar" },

        ["@boolean"] = { link = "Boolean" },
        ["@number"] = { link = "Number" },
        ["@number.float"] = { link = "Float" },

        -- Types
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { fg = p.yellow, style = o.styles.properties or { "italic" } },
        ["@type.definition"] = { link = "Type" },

        ["@attribute"] = { link = "Constant" },
        ["@property"] = { fg = p.lavender, style = o.styles.properties or {} },

        -- Functions
        ["@function"] = { link = "Function" },
        ["@function.builtin"] = { fg = p.peach, style = o.styles.functions or {} },
        ["@function.call"] = { link = "Function" },
        ["@function.macro"] = { fg = p.teal, style = o.styles.functions or {} },

        ["@function.method"] = { link = "Function" },
        ["@function.method.call"] = { link = "Function" },

        ["@constructor"] = { fg = p.sapphire },
        ["@operator"] = { link = "Operator" },

        -- Keywords
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.modifier"] = { link = "Keyword" },
        ["@keyword.type"] = { link = "Keyword" },
        ["@keyword.coroutine"] = { link = "Keyword" },
        ["@keyword.function"] = { fg = p.mauve, style = o.styles.keywords or {} },
        ["@keyword.operator"] = { link = "Operator" },
        ["@keyword.import"] = { link = "Include" },
        ["@keyword.repeat"] = { link = "Repeat" },
        ["@keyword.return"] = { fg = p.mauve, style = o.styles.keywords or {} },
        ["@keyword.debug"] = { link = "Exception" },
        ["@keyword.exception"] = { link = "Exception" },

        ["@keyword.conditional"] = { link = "Conditional" },
        ["@keyword.conditional.ternary"] = { link = "Operator" },

        ["@keyword.directive"] = { link = "PreProc" },
        ["@keyword.directive.define"] = { link = "Define" },
        -- JS & derivative
        ["@keyword.export"] = { fg = p.sky, style = o.styles.keywords },

        -- Punctuation
        ["@punctuation.delimiter"] = { link = "Delimiter" },
        ["@punctuation.bracket"] = { fg = p.overlay2 },
        ["@punctuation.special"] = { link = "Special" },

        -- Comment
        ["@comment"] = { link = "Comment" },
        ["@comment.documentation"] = { link = "Comment" },

        ["@comment.error"] = { fg = p.base, bg = p.red },
        ["@comment.warning"] = { fg = p.base, bg = p.yellow },
        ["@comment.hint"] = { fg = p.base, bg = p.blue },
        ["@comment.todo"] = { fg = p.base, bg = p.flamingo },
        ["@comment.note"] = { fg = p.base, bg = p.rosewater },

        -- Markup
        ["@markup"] = { fg = p.text },
        ["@markup.strong"] = { fg = p.maroon, style = { "bold" } },
        ["@markup.italic"] = { fg = p.maroon, style = { "italic" } },
        ["@markup.strikethrough"] = { fg = p.text, style = { "strikethrough" } },
        ["@markup.underline"] = { link = "Underlined" },

        ["@markup.heading"] = { fg = p.blue, style = { "bold" } },

        ["@markup.math"] = { fg = p.blue },
        ["@markup.quote"] = { fg = p.maroon, style = { "bold" } },
        ["@markup.environment"] = { fg = p.pink },
        ["@markup.environment.name"] = { fg = p.blue },

        ["@markup.link"] = { link = "Tag" },
        ["@markup.link.label"] = { link = "Label" },
        ["@markup.link.url"] = { fg = p.rosewater, style = { "italic", "underline" } },

        ["@markup.raw"] = { fg = p.teal },

        ["@markup.list"] = { link = "Special" },
        ["@markup.list.checked"] = { fg = p.green },
        ["@markup.list.unchecked"] = { fg = p.overlay1 },

        -- Diff
        ["@diff.plus"] = { link = "diffAdded" },
        ["@diff.minus"] = { link = "diffRemoved" },
        ["@diff.delta"] = { link = "diffChanged" },

        -- Tags
        ["@tag"] = { fg = p.mauve },
        ["@tag.attribute"] = { fg = p.teal, style = o.styles.miscs or { "italic" } },
        ["@tag.delimiter"] = { fg = p.sky },

        -- Misc
        ["@error"] = { link = "Error" },

        -- Language specific:
        -- bash
        ["@function.builtin.bash"] = { fg = p.red, style = o.styles.miscs or { "italic" } },

        -- markdown
        ["@markup.heading.1.markdown"] = { link = "rainbow1" },
        ["@markup.heading.2.markdown"] = { link = "rainbow2" },
        ["@markup.heading.3.markdown"] = { link = "rainbow3" },
        ["@markup.heading.4.markdown"] = { link = "rainbow4" },
        ["@markup.heading.5.markdown"] = { link = "rainbow5" },
        ["@markup.heading.6.markdown"] = { link = "rainbow6" },

        -- java
        ["@constant.java"] = { fg = p.teal },

        -- css
        ["@property.css"] = { fg = p.lavender },
        ["@property.id.css"] = { fg = p.blue },
        ["@property.class.css"] = { fg = p.yellow },
        ["@type.css"] = { fg = p.lavender },
        ["@type.tag.css"] = { fg = p.mauve },
        ["@string.plain.css"] = { fg = p.peach },
        ["@number.css"] = { fg = p.peach },

        -- toml
        ["@property.toml"] = { fg = p.blue },

        -- json
        ["@label.json"] = { fg = p.blue },

        -- lua
        ["@constructor.lua"] = { fg = p.flamingo },

        -- typescript
        ["@property.typescript"] = { fg = p.lavender, style = o.styles.properties or {} },
        ["@constructor.typescript"] = { fg = p.lavender },

        -- TSX (Typescript React)
        ["@constructor.tsx"] = { fg = p.lavender },
        ["@tag.attribute.tsx"] = { fg = p.teal, style = o.styles.miscs or { "italic" } },

        -- yaml
        ["@variable.member.yaml"] = { fg = p.blue },

        -- Ruby
        ["@string.special.symbol.ruby"] = { fg = p.flamingo },

        -- PHP
        ["@function.method.php"] = { link = "Function" },
        ["@function.method.call.php"] = { link = "Function" },

        -- C/CPP
        ["@type.builtin.c"] = { fg = p.yellow, style = {} },
        ["@property.cpp"] = { fg = p.text },
        ["@type.builtin.cpp"] = { fg = p.yellow, style = {} },

        -- gitcommit
        ["@comment.warning.gitcommit"] = { fg = p.yellow },

        -- gitignore
        ["@string.special.path.gitignore"] = { fg = p.text },

        -- Misc
        gitcommitSummary = { fg = p.rosewater, style = o.styles.miscs or { "italic" } },
        zshKSHFunction = { link = "Function" },
    }

    -- Legacy highlights
    colors["@parameter"] = colors["@variable.parameter"]
    colors["@field"] = colors["@variable.member"]
    colors["@namespace"] = colors["@module"]
    colors["@float"] = colors["@number.float"]
    colors["@symbol"] = colors["@string.special.symbol"]
    colors["@string.regex"] = colors["@string.regexp"]

    colors["@text"] = colors["@markup"]
    colors["@text.strong"] = colors["@markup.strong"]
    colors["@text.emphasis"] = colors["@markup.italic"]
    colors["@text.underline"] = colors["@markup.underline"]
    colors["@text.strike"] = colors["@markup.strikethrough"]
    colors["@text.uri"] = colors["@markup.link.url"]
    colors["@text.math"] = colors["@markup.math"]
    colors["@text.environment"] = colors["@markup.environment"]
    colors["@text.environment.name"] = colors["@markup.environment.name"]

    colors["@text.title"] = colors["@markup.heading"]
    colors["@text.literal"] = colors["@markup.raw"]
    colors["@text.reference"] = colors["@markup.link"]

    colors["@text.todo.checked"] = colors["@markup.list.checked"]
    colors["@text.todo.unchecked"] = colors["@markup.list.unchecked"]

    colors["@comment.note"] = colors["@comment.hint"]

    -- @text.todo is now for todo comments, not todo notes like in markdown
    colors["@text.todo"] = colors["@comment.todo"]
    colors["@text.warning"] = colors["@comment.warning"]
    colors["@text.note"] = colors["@comment.note"]
    colors["@text.danger"] = colors["@comment.error"]

    -- @text.uri is now
    -- > @markup.link.url in markup links
    -- > @string.special.url outside of markup
    colors["@text.uri"] = colors["@markup.link.uri"]

    colors["@method"] = colors["@function.method"]
    colors["@method.call"] = colors["@function.method.call"]

    colors["@text.diff.add"] = colors["@diff.plus"]
    colors["@text.diff.delete"] = colors["@diff.minus"]

    colors["@type.qualifier"] = colors["@keyword.modifier"]
    colors["@keyword.storage"] = colors["@keyword.modifier"]
    colors["@define"] = colors["@keyword.directive.define"]
    colors["@preproc"] = colors["@keyword.directive"]
    colors["@storageclass"] = colors["@keyword.storage"]
    colors["@conditional"] = colors["@keyword.conditional"]
    colors["@exception"] = colors["@keyword.exception"]
    colors["@include"] = colors["@keyword.import"]
    colors["@repeat"] = colors["@keyword.repeat"]

    colors["@symbol.ruby"] = colors["@string.special.symbol.ruby"]

    colors["@variable.member.yaml"] = colors["@field.yaml"]

    colors["@text.title.1.markdown"] = colors["@markup.heading.1.markdown"]
    colors["@text.title.2.markdown"] = colors["@markup.heading.2.markdown"]
    colors["@text.title.3.markdown"] = colors["@markup.heading.3.markdown"]
    colors["@text.title.4.markdown"] = colors["@markup.heading.4.markdown"]
    colors["@text.title.5.markdown"] = colors["@markup.heading.5.markdown"]
    colors["@text.title.6.markdown"] = colors["@markup.heading.6.markdown"]

    colors["@method.php"] = colors["@function.method.php"]
    colors["@method.call.php"] = colors["@function.method.call.php"]

    return colors
end

return groups
