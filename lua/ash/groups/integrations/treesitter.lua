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
        ["@variable.builtin"] = { fg = p.crimson, style = o.styles.properties or {} },
        ["@variable.parameter"] = { fg = p.rust, style = o.styles.variables or {} },
        ["@variable.member"] = { fg = p.fog },

        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { fg = p.frost, style = o.styles.keywords or {} },
        ["@constant.macro"] = { link = "Macro" },

        ["@module"] = { fg = p.fog, style = o.styles.miscs or { "italic" } },
        ["@label"] = { link = "Label" },

        -- Literals
        ["@string"] = { link = "String" },
        ["@string.documentation"] = { fg = p.tide, style = o.styles.strings or {} },
        ["@string.regexp"] = { fg = p.frost, style = o.styles.strings or {} },
        ["@string.escape"] = { fg = p.ember, style = o.styles.strings or {} },
        ["@string.special"] = { link = "Special" },
        ["@string.special.path"] = { link = "Special" },
        ["@string.special.symbol"] = { fg = p.rose },
        ["@string.special.url"] = { fg = p.seafoam, style = { "italic", "underline" } },

        ["@character"] = { link = "Character" },
        ["@character.special"] = { link = "SpecialChar" },

        ["@boolean"] = { link = "Boolean" },
        ["@number"] = { link = "Number" },
        ["@number.float"] = { link = "Float" },

        -- Types
        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { fg = p.crimson, style = o.styles.properties or { "italic" } },
        ["@type.definition"] = { link = "Type" },

        ["@attribute"] = { link = "Constant" },
        ["@property"] = { fg = p.fog, style = o.styles.properties or {} },

        -- Functions
        ["@function"] = { link = "Function" },
        ["@function.builtin"] = { fg = p.frost, style = o.styles.functions or {} },
        ["@function.call"] = { link = "Function" },
        ["@function.macro"] = { fg = p.tide, style = o.styles.functions or {} },

        ["@function.method"] = { link = "Function" },
        ["@function.method.call"] = { link = "Function" },

        ["@constructor"] = { fg = p.drift },
        ["@operator"] = { link = "Operator" },

        -- Keywords
        ["@keyword"] = { link = "Keyword" },
        ["@keyword.modifier"] = { link = "Keyword" },
        ["@keyword.type"] = { link = "Keyword" },
        ["@keyword.coroutine"] = { link = "Keyword" },
        ["@keyword.function"] = { fg = p.storm, style = o.styles.keywords or {} },
        ["@keyword.operator"] = { link = "Operator" },
        ["@keyword.import"] = { link = "Include" },
        ["@keyword.repeat"] = { link = "Repeat" },
        ["@keyword.return"] = { fg = p.storm, style = o.styles.keywords or {} },
        ["@keyword.debug"] = { link = "Exception" },
        ["@keyword.exception"] = { link = "Exception" },

        ["@keyword.conditional"] = { link = "Conditional" },
        ["@keyword.conditional.ternary"] = { link = "Operator" },

        ["@keyword.directive"] = { link = "PreProc" },
        ["@keyword.directive.define"] = { link = "Define" },
        -- JS & derivative
        ["@keyword.export"] = { fg = p.slate, style = o.styles.keywords },

        -- Punctuation
        ["@punctuation.delimiter"] = { link = "Delimiter" },
        ["@punctuation.bracket"] = { fg = p.overlay2 },
        ["@punctuation.special"] = { link = "Special" },

        -- Comment
        ["@comment"] = { link = "Comment" },
        ["@comment.documentation"] = { link = "Comment" },

        ["@comment.error"] = { fg = p.base, bg = p.crimson },
        ["@comment.warning"] = { fg = p.base, bg = p.rust },
        ["@comment.hint"] = { fg = p.base, bg = p.charcoal },
        ["@comment.todo"] = { fg = p.base, bg = p.rose },
        ["@comment.note"] = { fg = p.base, bg = p.seafoam },

        -- Markup
        ["@markup"] = { fg = p.text },
        ["@markup.strong"] = { fg = p.rust, style = { "bold" } },
        ["@markup.italic"] = { fg = p.rust, style = { "italic" } },
        ["@markup.strikethrough"] = { fg = p.text, style = { "strikethrough" } },
        ["@markup.underline"] = { link = "Underlined" },

        ["@markup.heading"] = { fg = p.charcoal, style = { "bold" } },

        ["@markup.math"] = { fg = p.charcoal },
        ["@markup.quote"] = { fg = p.rust, style = { "bold" } },
        ["@markup.environment"] = { fg = p.ember },
        ["@markup.environment.name"] = { fg = p.charcoal },

        ["@markup.link"] = { link = "Tag" },
        ["@markup.link.label"] = { link = "Label" },
        ["@markup.link.url"] = { fg = p.seafoam, style = { "italic", "underline" } },

        ["@markup.raw"] = { fg = p.tide },

        ["@markup.list"] = { link = "Special" },
        ["@markup.list.checked"] = { fg = p.sage },
        ["@markup.list.unchecked"] = { fg = p.overlay1 },

        -- Diff
        ["@diff.plus"] = { link = "diffAdded" },
        ["@diff.minus"] = { link = "diffRemoved" },
        ["@diff.delta"] = { link = "diffChanged" },

        -- Tags
        ["@tag"] = { fg = p.storm },
        ["@tag.attribute"] = { fg = p.tide, style = o.styles.miscs or { "italic" } },
        ["@tag.delimiter"] = { fg = p.slate },

        -- Misc
        ["@error"] = { link = "Error" },

        -- Language specific:
        -- bash
        ["@function.builtin.bash"] = { fg = p.crimson, style = o.styles.miscs or { "italic" } },

        -- markdown
        ["@markup.heading.1.markdown"] = { link = "rainbow1" },
        ["@markup.heading.2.markdown"] = { link = "rainbow2" },
        ["@markup.heading.3.markdown"] = { link = "rainbow3" },
        ["@markup.heading.4.markdown"] = { link = "rainbow4" },
        ["@markup.heading.5.markdown"] = { link = "rainbow5" },
        ["@markup.heading.6.markdown"] = { link = "rainbow6" },

        -- java
        ["@constant.java"] = { fg = p.tide },

        -- css
        ["@property.css"] = { fg = p.fog },
        ["@property.id.css"] = { fg = p.charcoal },
        ["@property.class.css"] = { fg = p.crimson },
        ["@type.css"] = { fg = p.fog },
        ["@type.tag.css"] = { fg = p.storm },
        ["@string.plain.css"] = { fg = p.frost },
        ["@number.css"] = { fg = p.frost },

        -- toml
        ["@property.toml"] = { fg = p.charcoal },

        -- json
        ["@label.json"] = { fg = p.charcoal },

        -- lua
        ["@constructor.lua"] = { fg = p.rose },

        -- typescript
        ["@property.typescript"] = { fg = p.fog, style = o.styles.properties or {} },
        ["@constructor.typescript"] = { fg = p.fog },

        -- TSX (Typescript React)
        ["@constructor.tsx"] = { fg = p.fog },
        ["@tag.attribute.tsx"] = { fg = p.tide, style = o.styles.miscs or { "italic" } },

        -- yaml
        ["@variable.member.yaml"] = { fg = p.charcoal },

        -- Ruby
        ["@string.special.symbol.ruby"] = { fg = p.rose },

        -- PHP
        ["@function.method.php"] = { link = "Function" },
        ["@function.method.call.php"] = { link = "Function" },

        -- C/CPP
        ["@type.builtin.c"] = { fg = p.crimson, style = {} },
        ["@property.cpp"] = { fg = p.text },
        ["@type.builtin.cpp"] = { fg = p.crimson, style = {} },

        -- gitcommit
        ["@comment.warning.gitcommit"] = { fg = p.rust },

        -- gitignore
        ["@string.special.path.gitignore"] = { fg = p.text },

        -- Misc
        gitcommitSummary = { fg = p.seafoam, style = o.styles.miscs or { "italic" } },
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
