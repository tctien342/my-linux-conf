local utils = require 'configs.utils'
local map = utils.map

-- Close current buffer
map('n', '<C-w>', '<cmd>BClose<cr>')

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

