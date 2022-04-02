-- Scroll
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = false, -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false -- Disable "Performance Mode" on all buffers.
})

local t = {}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '233', [['sine']]}}
t['<C-d>'] = {'scroll', {'vim.wo.scroll', 'true', '233', [['sine']]}}
require('neoscroll.config').set_mappings(t)

-- Move block code
require("gomove").setup {
    -- whether or not to map default key bindings, (true/false)
    map_defaults = false,
    -- whether or not to reindent lines moved vertically (true/false)
    reindent = true,
    -- whether or not to undojoin same direction moves (true/false)
    undojoin = true,
    -- whether to not to move past end column when moving blocks horizontally, (true/false)
    move_past_end_col = false
}

-- Tabs
require("bufferline").setup {options = {diagnostics = "nvim_lsp"}}

require("trouble").setup {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = {"<c-x>"}, -- open buffer in new split
        open_vsplit = {"<c-v>"}, -- open buffer in new vsplit
        open_tab = {"<c-t>"}, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

-- LUA LINE
local lualine = require 'lualine'
local gps = require("nvim-gps")
gps.setup()
lualine.setup({
    options = {theme = 'nightfox', section_separators = {left = '', right = ''}},
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{gps.get_location, cond = gps.is_available}},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
})

-- Config colors
require("lsp-colors").setup({Error = "#db4b4b", Warning = "#e0af68", Information = "#0db9d7", Hint = "#10B981"})
require'colorizer'.setup()

-- Comment code
require('nvim_comment').setup()

-- Identline
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#304866 gui=nocombine]]
require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {"IndentBlanklineIndent5", "IndentBlanklineIndent6"},
    buftype_exclude = {"terminal"},
    filetype_exclude = {"alpha"}
}

-- Auto pair with COQ
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
npairs.setup({map_bs = false, map_cr = false})

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], {expr = true, noremap = true})
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], {expr = true, noremap = true})
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], {expr = true, noremap = true})
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], {expr = true, noremap = true})

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({'selected'}).selected ~= -1 then
            return npairs.esc('<c-y>')
        else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
        end
    else
        return npairs.autopairs_cr()
    end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', {expr = true, noremap = true})

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({'mode'}).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end

remap('i', '<bs>', 'v:lua.MUtils.BS()', {expr = true, noremap = true})
