-- local nightfox = require('nightfox')
-- 
-- nightfox.setup({
--     fox = "nordfox", -- change the colorscheme to use nordfox
--     transparent = true,
-- })
-- 
-- -- Load the configuration set above and apply the colorscheme
-- nightfox.load()

require'telescope'.load_extension('project')
require('telescope').setup {
    pickers = {
        find_files = {theme = "dropdown"},
        live_grep = {theme = "dropdown"},
        buffers = {theme = "dropdown"},
        lsp_code_actions = {theme = "dropdown"}
    },
    extensions = {
      project = {
          base_dirs = {
            {'~/Sources', max_depth = 2},
          },
          hidden_files = true -- default: false
      }
    }
}
