require("lsp/init")

-- Border hover lsp info
local lsp = vim.lsp
lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {border = "rounded"})

-- Allow show function info while typing
require"lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window = true,
    handler_opts = {border = "rounded"}
})

