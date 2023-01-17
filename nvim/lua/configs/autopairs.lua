local config = function()
  local npairs = require('nvim-autopairs')
  -- Initialize config
  npairs.setup({
    check_ts = true,
    ts_config = {
      lua = { 'string' }, -- it will not add a pair on that treesitter node
      javascript = { 'template_string' },
      typescript = { 'template_string' },
      java = false -- don't check treesitter on java
    }
  })

  -- Using with nvim-cmp
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end

return config
