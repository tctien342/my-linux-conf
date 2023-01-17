local config = function()
  vim.opt.background = "dark" -- set this to dark or light
  vim.cmd.colorscheme "oxocarbon"
  -- vim.cmd([[
  --     hi NormalFloat guibg=NONE
  --     hi Pmenu guibg=NONE
  --     hi SpellBad cterm=underline guisp=gray
  --     hi TelescopeBorder guifg=cyan guibg=NONE
  --     hi BorderBG guifg=#19D2EF guibg=NONE
  --     hi FloatBorder guibg=NONE guifg=yellow
  --     hi ErrorFloat guibg=NONE
  --     hi WarningFloat guibg=NONE
  --     hi InfoFloat guibg=NONE
  --     hi HintFloat guibg=NONE
  --   ]])
end

return config
