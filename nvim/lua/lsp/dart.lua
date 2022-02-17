local default_key = require("lsp/default")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("flutter-tools").setup {
    lsp = {
        on_attach = function(client, bufnr)
            default_key(client, bufnr)
        end,
        capabilities = capabilities,
        settings = {showTodos = true, completeFunctionCalls = true, analysisExcludedFolders = {"/Users/saintno/Applications/flutter"}}
    }
}

