local coq = require("lsp/coq")
local lspconfig = require("lspconfig")
local default_key = require("lsp/default")

lspconfig.dartls.setup(coq.lsp_ensure_capabilities({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        default_key(client, bufnr)
    end
}))
