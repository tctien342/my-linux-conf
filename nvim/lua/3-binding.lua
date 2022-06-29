local action = require('lspsaga.action')
local lsp_action = require('lspsaga.codeaction')
local utils = require 'configs.utils'
local map = utils.map

------------------------------------------------------------------
-- Quick shortcut value define                                   -
------------------------------------------------------------------
local tele_defi =
    '<cmd>lua require("telescope.builtin").lsp_definitions({initial_mode = "normal"})<cr>'
local diag_log = '<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = "single" })<cr>'
local tele_ref = '<cmd>lua require("telescope.builtin").lsp_references()<cr>'
local saga_range_action = function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-U>', true, false, true))
    lsp_action.range_code_action()
end
local saga_scroll_up = function()
    action.smart_scroll_with_saga(1)
end
local saga_scroll_down = function()
    action.smart_scroll_with_saga(1)
end

------------------------------------------------------------------
-- Code editor                                                   -
------------------------------------------------------------------
map('n', 'gs', '<cmd>w<cr>') ------------------------------------- Go save
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>') --------- Go declaration
map('n', 'gd', tele_defi) ---------------------------------------- Go definitions
map('n', 'ga', '<cmd>Lspsaga code_action<CR>') ------------------- Go action, code action
map('v', 'ga', saga_range_action) -------------------------------- Go action, code action in visual mode
map('n', 'gr', '<cmd>Lspsaga rename<CR>') ------------------------ Go rename, rename variable
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<cr>') ---------- Go format, call code format
map('n', 'gp', '<cmd>PrettierAsync<cr>') ------------------------- Go prettier, call prettier
map('n', 'gj', tele_ref) ----------------------------------------- Go jump, jump to referrals
map('n', 'gw', '<cmd>HopWord<cr>') ------------------------------- Go Word, jump into word
map('n', 'gl', '<cmd>HopLine<cr>') ------------------------------- Go line, jump into line
map('n', '``', diag_log) ----------------------------------------- Show diagnostic log under cursor
map('n', '<C-q>', '<cmd>BClose<cr>') ----------------------------- Close current buffer
map('n', 'D', '<cmd>Lspsaga hover_doc<CR>') ---------------------- Hover function detail
map('n', '<C-f>', saga_scroll_up) -------------------------------- Move hover popup up, Forward
map('n', '<C-b>', saga_scroll_down) ------------------------------ Move hover popup down, Backward

map('n', '<S-h>', '<Plug>GoNSMLeft') ----------------------------- Move current character left
map('n', '<S-j>', '<Plug>GoNSMDown') ----------------------------- Move current character down
map('n', '<S-k>', '<Plug>GoNSMUp') ------------------------------- Move current character up
map('n', '<S-l>', '<Plug>GoNSMRight') ---------------------------- Move current character right
map('v', '<S-h>', '<Plug>GoVSMLeft') ----------------------------- Move current block code left
map('v', '<S-j>', '<Plug>GoVSMDown') ----------------------------- Move current block code down
map('v', '<S-k>', '<Plug>GoVSMUp') ------------------------------- Move current block code up
map('v', '<S-l>', '<Plug>GoVSMRight') ---------------------------- Move current block code right

------------------------------------------------------------------
-- Work space management                                         -
------------------------------------------------------------------
map('n', '<leader>ww', '<cmd>Telescope workspaces<cr>') ----------- Open work spaces
map('n', '<leader>wa', '<cmd>WorkspacesAdd<cr>') ------------------ Add current root into workspace
map('n', '<leader>wr', '<cmd>WorkspacesRemove<cr>') --------------- Remove current root from workspaces

------------------------------------------------------------------
-- Tabs management                                               -
------------------------------------------------------------------
map('n', 'gt', '<cmd>BufferLinePick<cr>') ------------------------ Go tab, quick tab jumping
map('n', '`1', '<cmd>BufferLineGoToBuffer 1<cr>') ---------------- Switch to tab 1
map('n', '`2', '<cmd>BufferLineGoToBuffer 2<cr>') ---------------- Switch to tab 2
map('n', '`3', '<cmd>BufferLineGoToBuffer 3<cr>') ---------------- Switch to tab 3
map('n', '`4', '<cmd>BufferLineGoToBuffer 4<cr>') ---------------- Switch to tab 4
map('n', '`5', '<cmd>BufferLineGoToBuffer 5<cr>') ---------------- Switch to tab 5
map('n', '`6', '<cmd>BufferLineGoToBuffer 6<cr>') ---------------- Switch to tab 6
map('n', '`7', '<cmd>BufferLineGoToBuffer 7<cr>') ---------------- Switch to tab 7
map('n', '`8', '<cmd>BufferLineGoToBuffer 8<cr>') ---------------- Switch to tab 8
map('n', '`9', '<cmd>BufferLineGoToBuffer 9<cr>') ---------------- Switch to tab 9

------------------------------------------------------------------
-- Utilities                                                     -
------------------------------------------------------------------
map('n', '<leader>t', '<cmd>NvimTreeToggle<cr>') ------------------------ Toggle file explorer
map('n', '<leader>f', '<cmd>Telescope find_files<cr>') ------------------ Open file finder
map('n', '<leader>s', '<cmd>Telescope live_grep<cr>') ------------------- Open string finder, aka text search
map('n', '<leader><leader>', '<cmd>Telescope buffers<cr>') -------------- Open buffer finder, search opened files
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>') ------------------------ Open diagnostic list on current opened buffer
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>') -- Open diagnostic list on current work's space
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>') --- Open diagnostic list on current file
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>') --------------- Open quickfix list

------------------------------------------------------------------
-- Terminal integration                                          -
------------------------------------------------------------------
map('n', '<C-`>', '<cmd>ToggleTermToggleAll<cr>') ---------------- Toggle terminal view
map('i', '<C-`>', '<cmd>ToggleTermToggleAll<cr>') ---------------- Toggle terminal view, insert mode
function _G.set_terminal_keymaps()
    local opts = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end
vim.cmd([[
      autocmd! TermOpen term://* lua set_terminal_keymaps()

      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

      autocmd TermEnter term://*toggleterm#*
            \ tnoremap <silent><c-`> <Cmd>ToggleTermToggleAll<CR>

      nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
      inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
]])

