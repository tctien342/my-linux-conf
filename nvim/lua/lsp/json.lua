local lspconfig = require("lspconfig")
local default_key = require("lsp/default")

local capabilities_json = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities_json.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup({
    capabilities = capabilities_json,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        default_key(client, bufnr)
    end
})

