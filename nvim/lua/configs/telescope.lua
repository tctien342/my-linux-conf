local config = function()
    require('telescope').setup({
        extensions = {['ui-select'] = {require('telescope.themes').get_dropdown {}}},
        pickers = {
            find_files = {theme = 'dropdown'},
            live_grep = {theme = 'dropdown'},
            buffers = {theme = 'dropdown'},
            workspaces = {
                -- keep insert mode after selection in the picker, default is false
                keep_insert = false
            }

            -- lsp_code_actions = {theme = 'dropdown'}
        }
    })
end

return config
