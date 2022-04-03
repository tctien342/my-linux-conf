local explorer_config = require('explorer')
local utils = require('utils')

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    -- Auto tag for HTML, JSX, TSX
    use {
        'AndrewRadev/tagalong.vim', {
            'alvan/vim-closetag',
            config = function()
                vim.cmd([[
                    let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
                    let g:closetag_regions = {
                        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
                        \ 'javascript.jsx': 'jsxRegion',
                        \ 'typescriptreact': 'jsxRegion,tsxRegion',
                        \ 'javascriptreact': 'jsxRegion',
                        \ }
                ]])
            end
        }
    }

    -- Navigtion using HJKL
    use {'christoomey/vim-tmux-navigator'}

    -- Autocomplete using CMP
    use {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp', 'onsails/lspkind-nvim',
        'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'
    }

    -- Collection of configurations for the built-in LSP client
    use {
        'sheerun/vim-polyglot', 'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer', 'stevearc/dressing.nvim', {
            'j-hui/fidget.nvim',
            config = function()
                require"fidget".setup {window = {blend = 0}}
            end
        }
    }

    -- Rust support
    use {
        'simrat39/rust-tools.nvim',
        requires = 'neovim/nvim-lspconfig',
        config = function() require('rust-tools').setup({}) end
    }

    -- Flutter support
    use {
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require("flutter-tools").setup {} end
    }

    -- For checking and debug LSP diagnostic
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {}
            vim.cmd([[
                nnoremap <leader>xx <cmd>TroubleToggle<cr>
                nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
                nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
                nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
                nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
            ]])
        end
    }

    -- Code action sign
    use {
        'kosayoda/nvim-lightbulb',
        config = function()
            require'nvim-lightbulb'.setup {}
            vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
        end
    }

    -- Function's signature when coding
    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            require"lsp_signature".setup({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                floating_window = true,
                handler_opts = {border = "none"}
            })
        end
    }

    -- For files searching, code actions
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function()
            require('telescope').setup({
                pickers = {
                    find_files = {theme = "dropdown"},
                    live_grep = {theme = "dropdown"},
                    buffers = {theme = "dropdown"},
                    lsp_code_actions = {theme = "dropdown"}
                }
            })
            vim.cmd([[
                    nnoremap <leader>f <cmd>Telescope find_files<cr>
                    nnoremap <leader>s <cmd>Telescope live_grep<cr>
                    nnoremap <leader><leader> <cmd>Telescope buffers<cr>
                ]])
        end
    }

    -- Format code for common languages
    use {
        'prettier/vim-prettier',
        run = 'npm i && npm i prettier-plugin-solidity'
    }

    -- Tree explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        },
        config = explorer_config
    }

    -- Fast close buffer with Leader-bx or Leader-bs
    use 'kyoz/ezbuf.vim'

    -- Multiple cursor with C-N
    use 'mg979/vim-visual-multi'

    -- Comment block of code
    use {
        'terrortylor/nvim-comment',
        config = function() require('nvim_comment').setup() end
    }

    -- Generate docstring
    use {'kkoomen/vim-doge', run = ':call doge#install()'}

    -- Theme of nvim, transparent background
    use {
        'joshdick/onedark.vim',
        config = function()
            vim.cmd([[
                colorscheme onedark
                hi Normal     ctermbg=NONE guibg=NONE
                hi LineNr     ctermbg=NONE guibg=NONE
                hi SignColumn ctermbg=NONE guibg=NONE
                hi Floaterm guibg=NONE
            ]])
        end
    }

    -- My best fen
    use {
        'github/copilot.vim',
        config = function()
            vim.cmd(
                [[imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")]])
        end
    }

    -- Color viewer
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }
    -- Buffer's tab
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require("bufferline").setup {
                options = {
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer",
                            text_align = "center"
                        }
                    }
                }
            }
            vim.cmd([[nnoremap <silent> gt :BufferLinePick<CR>]])
        end
    }
    -- Vim status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'codedark',
                    section_separators = {left = '', right = ''}
                }
            })
        end
    }
    -- Smooth scroll
    use {'karb94/neoscroll.nvim', config = utils.scroll_conf}
    -- Move block code
    use {
        'booperlv/nvim-gomove',
        config = function()
            require("gomove").setup {}
            vim.cmd([[
                nmap <S-h> <Plug>GoNSMLeft
                nmap <S-j> <Plug>GoNSMDown
                nmap <S-k> <Plug>GoNSMUp
                nmap <S-l> <Plug>GoNSMRight

                xmap <S-h> <Plug>GoVSMLeft
                xmap <S-j> <Plug>GoVSMDown
                xmap <S-k> <Plug>GoVSMUp
                xmap <S-l> <Plug>GoVSMRight

                nmap <C-h> <Plug>GoNSDLeft
                nmap <C-j> <Plug>GoNSDDown
                nmap <C-k> <Plug>GoNSDUp
                nmap <C-l> <Plug>GoNSDRight

                xmap <C-h> <Plug>GoVSDLeft
                xmap <C-j> <Plug>GoVSDDown
                xmap <C-k> <Plug>GoVSDUp
                xmap <C-l> <Plug>GoVSDRight
            ]])
        end
    }
end)
