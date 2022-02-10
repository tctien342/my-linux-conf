local coq = require("lsp/coq")
local default_key = require("lsp/default")

require("flutter-tools").setup {
    lsp = coq.lsp_ensure_capabilities({
        on_attach = function(client, bufnr)
            default_key(client, bufnr)
        end,
        settings = {showTodos = true, completeFunctionCalls = true, analysisExcludedFolders = {"/Users/saintno/Applications/flutter"}}
    })
}

