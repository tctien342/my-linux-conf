vim.g.coq_settings = {
    keymap = {recommended = false, jump_to_mark = "<c-q>"},
    auto_start = true,
    clients = {lsp = {weight_adjust = 3}, tags = {weight_adjust = 2}, snippets = {weight_adjust = 2}}
}
local coq = require "coq"
return coq
