local utils = require 'configs.utils'
local map = utils.map

-- LSP MAPPING
-- Go save, save current file
map('n', 'gs', '<cmd>w<cr>')
-- Go defination
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
-- Call LSP hover -- Go detail
map('n', 'D', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- Call code action with telescope --  Go action
map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
-- Rename using LSP -- Go rename
map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>')
-- Format using LSP -- Go format
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<cr>')
-- Jump into other instance -- Go Jump
map('n', 'gj', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
-- Diagnostic details
map('n', '``', '<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = "single" })<cr>')

-- Close current buffer
map('n', '<C-q>', '<cmd>BClose<cr>')

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

