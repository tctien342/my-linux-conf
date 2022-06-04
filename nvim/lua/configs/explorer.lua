-- This file contain setup for neotree
local config = function()
    vim.cmd([[
        nnoremap <leader>t <cmd>NvimTreeToggle<cr>
    ]])

    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define('DiagnosticSignError', {text = ' ', texthl = 'DiagnosticSignError'})
    vim.fn.sign_define('DiagnosticSignWarn', {text = ' ', texthl = 'DiagnosticSignWarn'})
    vim.fn.sign_define('DiagnosticSignInfo', {text = ' ', texthl = 'DiagnosticSignInfo'})
    vim.fn.sign_define('DiagnosticSignHint', {text = '', texthl = 'DiagnosticSignHint'})

    require'nvim-tree'.setup {
        auto_reload_on_write = true,
        create_in_closed_folder = true,
        update_cwd = true,
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            icons = {hint = '', info = '', warning = '', error = ''}
        },
        git = {enable = true, ignore = false, timeout = 400},
        view = {
            side = 'left',
            preserve_window_proportions = true,
            mappings = {list = {{key = '<C-t>', action = ''}}}
        },
        hijack_directories = {enable = true, auto_open = false},
        actions = {open_file = {resize_window = true}},
        renderer = {
            highlight_git = false,
            highlight_opened_files = 'all',
            icons = {show = {git = true}}
        },
        update_focused_file = {enable = false, update_cwd = false, ignore_list = {}}
    }
end

return config
