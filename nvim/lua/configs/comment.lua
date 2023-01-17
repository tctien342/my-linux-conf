local config = function()
  require('Comment').setup({
    ---@param ctx Ctx
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
  })
end

return config
