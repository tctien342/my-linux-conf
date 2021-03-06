local config = function()
    require'nvim-treesitter.configs'.setup {
        -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = {
            'typescript', 'python', 'javascript', 'html', 'css', 'bash', 'json', 'scss', 'tsx',
            'rust', 'go', 'cpp', 'cmake', 'lua', 'solidity', 'yaml', 'fish'
        },

        -- Install languages synchronously (only applied to `ensure_installed`)
        -- sync_install = true,
        autotag = {enable = true}, -- Plugin
        context_commentstring = {enable = true}, -- Plugin
        highlight = {
            enable = false,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false
        },
        rainbow = {enable = true, extended_mode = false} -- Plugin to rainbow block code
    }
    vim.cmd([[
      hi rainbowcol1 guifg=white
    ]])
end

return config
