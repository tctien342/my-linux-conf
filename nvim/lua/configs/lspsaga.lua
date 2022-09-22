local config = function()
    local saga = require('lspsaga')

    saga.init_lsp_saga({
        border_style = 'single',
        move_in_saga = {prev = 'k', next = 'j'},
        -- show_diagnostic_source = true,
        code_action_icon = '💡',
        code_action_num_shortcut = false,
        code_action_lightbulb = {
            enable = false,
            sign = true,
            sign_priority = 20,
            virtual_text = true
        },
        code_action_keys = {quit = 'q', exec = '<CR>'},
        rename_action_quit = '<C-c>',
        max_preview_lines = 20,
        finder_action_keys = {
            open = 'o',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            quit = 'q',
            scroll_down = '<C-f>',
            scroll_up = '<C-b>' -- quit can be a table
        }
    })
end

return config
