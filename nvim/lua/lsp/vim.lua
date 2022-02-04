local coq = require("lsp/coq")
local lspconfig = require("lspconfig")
local default_key = require("lsp/default")

lspconfig.vimls.setup(coq.lsp_ensure_capabilities({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        default_key(client, bufnr)
    end
}))
