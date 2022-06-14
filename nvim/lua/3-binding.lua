local utils = require 'configs.utils'
local map = utils.map

-- LSP MAPPING
-- Go save, save current file
map('n', 'gs', '<cmd>w<cr>')
-- Go defination
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
map('n', 'gd',
    '<cmd>lua require("telescope.builtin").lsp_definitions({initial_mode = "normal"})<cr>')
-- Call LSP hover -- Go detail
map('n', 'D', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- Call code action with telescope --  Go action
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
-- Rename using LSP -- Go rename
map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>')
-- Format using LSP -- Go format
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
-- Format using LSP -- Go prettier -> FE Format
map('n', 'gp', '<cmd>PrettierAsync<cr>')
-- Jump into other instance -- Go Jump
map('n', 'gj', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
-- Diagnostic details
map('n', '``', '<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = "single" })<cr>')

-- Close current buffer
map('n', '<C-q>', '<cmd>BClose<cr>')
map('n', '<C-`>', '<cmd>ToggleTermToggleAll<cr>')
-- map('i', '<C-`>', '<cmd>ToggleTermToggleAll<cr>')

-- Open Workspace
map('n', '<leader>w', '<cmd>Telescope workspaces<cr>')

-- Switching buffer with <`-number>
map('n', '`1', '<cmd>BufferLineGoToBuffer 1<cr>')
map('n', '`2', '<cmd>BufferLineGoToBuffer 2<cr>')
map('n', '`3', '<cmd>BufferLineGoToBuffer 3<cr>')
map('n', '`4', '<cmd>BufferLineGoToBuffer 4<cr>')
map('n', '`5', '<cmd>BufferLineGoToBuffer 5<cr>')
map('n', '`6', '<cmd>BufferLineGoToBuffer 6<cr>')
map('n', '`7', '<cmd>BufferLineGoToBuffer 7<cr>')
map('n', '`8', '<cmd>BufferLineGoToBuffer 8<cr>')
map('n', '`9', '<cmd>BufferLineGoToBuffer 9<cr>')

-- Using hop for jumping
map('n', 'gw', '<cmd>HopWord<cr>')
map('n', 'gl', '<cmd>HopLine<cr>')

-- Terminal mapping
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
vim.cmd([[
      autocmd! TermOpen term://* lua set_terminal_keymaps()

      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><c-`> <Cmd>ToggleTermToggleAll<CR>

      nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
      inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]])

