-- This file contain setup for neotree
local config = function()
    vim.cmd([[
        let g:nvim_tree_git_hl = 1
        let g:nvim_tree_highlight_opened_files = 1
        let g:nvim_tree_create_in_closed_folder = 1
        nnoremap <leader>t <cmd>NvimTreeToggle<cr>
    ]])

    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define('DiagnosticSignError', {text = ' ', texthl = 'DiagnosticSignError'})
    vim.fn.sign_define('DiagnosticSignWarn', {text = ' ', texthl = 'DiagnosticSignWarn'})
    vim.fn.sign_define('DiagnosticSignInfo', {text = ' ', texthl = 'DiagnosticSignInfo'})
    vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'DiagnosticSignHint'})

    require'nvim-tree'.setup {
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            icons = {hint = '', info = '', warning = '', error = ''}
        },
        git = {enable = true, ignore = false, timeout = 400},
        view = {side = 'left', preserve_window_proportions = true},
        hijack_directories = {enable = true, auto_open = false},
        actions = {open_file = {resize_window = true}}
    }
end

return config
