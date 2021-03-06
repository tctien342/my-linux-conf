local config = function()
    -- GITHUB THEME CONFIG
    -- require('github-theme').setup({
    --     theme_style = 'dimmed',
    --     transparent = true,
    --     function_style = 'bold',
    --     dark_float = false,
    --     dark_sidebar = false
    -- })
    -- Transparency float widow
    vim.cmd([[
      let g:sonokai_style = 'andromeda'
      let g:sonokai_better_performance = 1
      let g:sonokai_enable_italic = 1
      let g:sonokai_transparent_background = 1
      colorscheme sonokai

      hi NormalFloat guibg=NONE
      hi Pmenu guibg=NONE
      hi SpellBad cterm=underline guisp=gray
      hi TelescopeBorder guifg=cyan guibg=NONE
      hi BorderBG guifg=#19D2EF guibg=NONE
      hi FloatBorder guibg=NONE guifg=yellow
      hi ErrorFloat guibg=NONE
      hi WarningFloat guibg=NONE
      hi InfoFloat guibg=NONE
      hi HintFloat guibg=NONE
    ]])
end

return config
