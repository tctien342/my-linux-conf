local config = function()
  require 'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
      'typescript', 'python', 'javascript', 'html', 'css', 'bash', 'json', 'scss', 'tsx',
      'rust', 'go', 'cpp', 'cmake', 'lua', 'solidity', 'yaml', 'fish', 'markdown', 'markdown_inline'
    },

    -- Install languages synchronously (only applied to `ensure_installed`)
    -- sync_install = true,
    auto_install = true,
    autotag = { enable = true }, -- Plugin
    context_commentstring = { enable = true }, -- Plugin
    highlight = { enable = true, additional_vim_regex_highlighting = { 'latex' } },
    rainbow = { enable = true, extended_mode = false } -- Plugin to rainbow block code
  }
  vim.cmd([[
      hi rainbowcol1 guifg=white
    ]])
end

return config
