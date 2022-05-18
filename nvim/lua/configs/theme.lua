local config = function()
    require('rose-pine').setup({
        dark_variant = 'moon',
        disable_background = true,
        disable_float_background = true,
        highlight_groups = {ColorColumn = {bg = 'rose'}}
    })
    vim.cmd([[
	colorscheme rose-pine
    ]])
end

return config
