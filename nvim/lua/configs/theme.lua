local config = function()
  vim.cmd([[
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
  vim.g.oxocarbon_lua_keep_terminal = true
  vim.g.oxocarbon_lua_transparent = true
  vim.g.oxocarbon_lua_alternative_telescope = true
  vim.cmd.colorscheme 'oxocarbon-lua'
end

return config
