local config = function()
    vim.opt.termguicolors = true
    vim.opt.list = true

    require("indent_blankline").setup {
        space_char_blankline = " ",
    }
end

return config
