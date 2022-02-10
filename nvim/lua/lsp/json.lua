local coq = require("lsp/coq")
local lspconfig = require("lspconfig")
local default_key = require("lsp/default")

local capabilities_json = vim.lsp.protocol.make_client_capabilities()
capabilities_json.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup(coq.lsp_ensure_capabilities({
    capabilities = capabilities_json,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        default_key(client, bufnr)
    end
}))

