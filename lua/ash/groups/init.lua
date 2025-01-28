local editor = require("ash.groups.editor")
local integrations = require("ash.groups.integrations")
local syntax = require("ash.groups.syntax")
local terminal = require("ash.groups.terminal")

return {
    editor = editor,
    syntax = syntax,
    terminal = terminal,
    integrations = integrations,
}
