local coq = require("lsp/coq")
local lspconfig = require("lspconfig")
local default_key = require("lsp/default")

local cssCap = vim.lsp.protocol.make_client_capabilities()
cssCap.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup(coq.lsp_ensure_capabilities({
    capabilities = cssCap,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        default_key(client, bufnr)
    end
}))
