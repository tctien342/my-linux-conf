local config = function()
    require('github-theme').setup({
        theme_style = 'dimmed',
        transparent = true,
        function_style = 'bold',
        dark_float = false,
        dark_sidebar = false
    })
    -- Transparency float widow
    vim.cmd([[
       hi NormalFloat guibg=NONE
       hi Pmenu guibg=NONE
       hi SpellBad cterm=underline guisp=gray
    ]])
end

return config
