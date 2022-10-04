local config = function()
  -- GITHUB THEME CONFIG
  -- require('github-theme').setup({
  --     theme_style = 'dimmed',
  --     transparent = true,
  --     function_style = 'bold',
  --     dark_float = false,
  --     dark_sidebar = false
  -- })
  vim.g.catppuccin_flavour = "mocha"
  require("catppuccin").setup({
    transparent_background = true,
    term_colors = true,
    integrations = {
      treesitter = true,
      cmp = true,
      gitsigns = true,
      telescope = true,
      nvimtree = true,
      hop = true,
      lsp_saga = true,
      ts_rainbow = true,
      lsp_trouble = true
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
  vim.cmd([[
      colorscheme catppuccin
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
