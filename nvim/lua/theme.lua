local nightfox = require('nightfox')

nightfox.setup({
    fox = "nordfox", -- change the colorscheme to use nordfox
    transparent = true,
    styles = {
        comments = "italic", -- change style of comments to be italic
        keywords = "bold", -- change style of keywords to be bold
        functions = "italic,bold" -- styles can be a comma separated list
    },
    inverse = {
        match_paren = true -- inverse the highlighting of match_parens
    },
    colors = {
        red = "#FF000", -- Override the red color for MAX POWER
        bg_alt = "#000000"
    },
    hlgroups = {
        TSPunctDelimiter = {fg = "${red}"}, -- Override a highlight group with the color red
        LspCodeLens = {bg = "#000000", style = "italic"}
    }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()

require('telescope').setup {
    pickers = {
        find_files = {theme = "dropdown"},
        live_grep = {theme = "dropdown"},
        buffers = {theme = "dropdown"},
        lsp_code_actions = {theme = "dropdown"}
    }

}
