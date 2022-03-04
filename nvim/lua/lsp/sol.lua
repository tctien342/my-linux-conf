local lspconfig = require("lspconfig")
local default_key = require("lsp/default")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- lspconfig.solang.setup({cmd = {"solang", "--language-server", "--target", "solana"}})

lspconfig.solidity_ls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        default_key(client, bufnr)
        local opts_lsp = {noremap = true, silent = true}
        vim.api.nvim_buf_set_keymap(bufnr, "n", 'gf', '<cmd>PrettierAsync<CR>', opts_lsp)
    end
})

vim.cmd("au BufRead,BufNewFile *.sol setfiletype solidity");
