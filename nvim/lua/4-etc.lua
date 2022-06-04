-- Preload telescope extension
require('telescope').load_extension('ui-select')
require('telescope').load_extension('workspaces')

function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd([[
      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><c-`> <Cmd>ToggleTermToggleAll<CR>

      nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
      inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]])
