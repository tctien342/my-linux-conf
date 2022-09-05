-- Preload telescope extension
require('telescope').load_extension('ui-select')
require('telescope').load_extension('workspaces')

-- LSP Utilities
require('hlargs').setup {}
require'dim'.setup {disable_lsp_decorations = true}

