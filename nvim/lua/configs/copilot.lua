local config = function()
  vim.defer_fn(function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        keymap = {
          accept = "<C-a>",
          next = "<C-i>",
        },
      },
      panel = {
        enabled = false,
      },
      server_opts_overrides = {
        settings = {
          advanced = {
            listCount = 10, -- #completions for panel
            inlineSuggestCount = 3, -- #completions for getCompletions
          }
        },
      }
    })
  end, 100)
end

return config
