local explorer_config = require('configs.explorer')
local scroll_config = require('configs.scroll')
local lualine_config = require('configs.lualine')
local treesitter_config = require('configs.treesister')
local gomove_config = require('configs.gomove')
local telescope_config = require('configs.telescope')
local theme_config = require('configs.theme')
local wilder_config = require('configs.wilder')

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }

    -- Treesitter for better language compatible
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = 'windwp/nvim-ts-autotag',
        run = ':TSUpdate',
        config = treesitter_config
    }

    -- Navigtion using HJKL
    use {'christoomey/vim-tmux-navigator'} -- Autocomplete using CMP

    -- Ma best fen
    use {
        'zbirenbaum/copilot.lua',
        event = {'VimEnter'},
        config = function()
            vim.defer_fn(function()
                require('copilot').setup()
            end, 100)
        end
    }
    use {'zbirenbaum/copilot-cmp', after = {'copilot.lua', 'nvim-cmp'}}

    use {
        'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', 'onsails/lspkind-nvim', 'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }

    -- Collection of configurations for the built-in LSP client
    use {
        'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer', 'RRethy/vim-illuminate', {
            'j-hui/fidget.nvim',
            config = function()
                require'fidget'.setup {window = {blend = 0}}
            end
        }
    }

    -- Rust support
    use {
        'simrat39/rust-tools.nvim',
        requires = {'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap'}
    }

    -- Flutter support
    use {
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('flutter-tools').setup {widget_guides = {enabled = true}}
        end
    }

    -- For checking and debug LSP diagnostic
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('trouble').setup {}
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
            require'lsp_signature'.setup({
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                hint_enable = true,
                fix_pos = false,
                auto_close_after = 3,
                floating_window = false,
                handler_opts = {border = 'single'}
            })
        end
    }

    -- For files searching, code actions
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = telescope_config
    }

    use {'nvim-telescope/telescope-ui-select.nvim', requires = {'nvim-telescope/telescope.nvim'}}

    -- Format code for common languages
    use {'prettier/vim-prettier', run = 'npm i && npm i prettier-plugin-solidity'}

    -- Tree explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- not strictly required, but recommended
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
        config = function()
            require('nvim_comment').setup()
        end
    }

    -- Generate docstring
    use {'kkoomen/vim-doge', run = ':call doge#install()'}

    -- Theme of nvim, transparent background
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v1.*',
        requires = {'nvim-lualine/lualine.nvim', 'ray-x/lsp_signature.nvim'},
        config = theme_config
    }

    -- Color viewer
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
    }
    -- Buffer's tab
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require('bufferline').setup {
                options = {
                    diagnostics = 'nvim_lsp',
                    offsets = {
                        {filetype = 'NvimTree', text = 'File Explorer', text_align = 'center'}
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
        config = lualine_config
    }

    -- Smooth scroll
    use {'karb94/neoscroll.nvim', config = scroll_config}
    -- Move block code
    use {'booperlv/nvim-gomove', config = gomove_config}

    -- Git lens alternative
    use {'f-person/git-blame.nvim'}

    -- Scrollbar with LSP support
    use {
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end
    }

    -- Auto forcus window
    use {
        'beauwilliams/focus.nvim',
        config = function()
            require('focus').setup({
                relativenumber = false,
                hybridnumber = false,
                cursorline = false,
                signcolumn = false,
                compatible_filetrees = {'neo-tree'},
                treewidth = 30
            })
        end
    }

    use {'gelguy/wilder.nvim', config = wilder_config}

    use {
        'andweeb/presence.nvim',
        config = function()
            require('presence'):setup({})
        end
    } -- Discord activity
end)
