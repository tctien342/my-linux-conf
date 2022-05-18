local config = function()
    require('rose-pine').setup({
        dark_variant = 'moon',
        disable_background = true,
        disable_float_background = true,
        highlight_groups = {ColorColumn = {bg = 'rose'}}
    })
    vim.cmd([[
	colorscheme rose-pine
	highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
	highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
	highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
	highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
	highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
	highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
    ]])
end

return config
