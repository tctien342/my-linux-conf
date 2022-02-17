local default_key = function(client, bufnr)
    require"lsp_signature".on_attach({auto_close_after = 3, transparency = 80, timer_interval = 100}, bufnr)
    local opts_lsp = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'D', '<cmd>lua vim.lsp.buf.hover()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'ga', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gr', '<cmd>lua require("cosmic-ui").rename()<CR>', opts_lsp)
    vim.api.nvim_buf_set_keymap(bufnr, "n", 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts_lsp)
end

return default_key
