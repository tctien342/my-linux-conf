-- This file contains util's configs and tools
function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function scroll()
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
end

return {map = map, scroll_conf = scroll}
