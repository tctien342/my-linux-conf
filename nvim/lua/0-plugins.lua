local explorer_config = require('configs.explorer')
local scroll_config = require('configs.scroll')
local lualine_config = require('configs.lualine')
local treesitter_config = require('configs.treesister')
local gomove_config = require('configs.gomove')
local telescope_config = require('configs.telescope')
local theme_config = require('configs.theme')
local wilder_config = require('configs.wilder')
local comment_config = require('configs.comment')

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
        requires = {
            'windwp/nvim-ts-autotag', 'JoosepAlviste/nvim-ts-context-commentstring',
            'p00f/nvim-ts-rainbow'
        },
        run = ':TSUpdate',
        config = treesitter_config
    }

    -- Dim unused variable
    use {
        'narutoxy/dim.lua',
        requires = {'nvim-treesitter/nvim-treesitter', 'neovim/nvim-lspconfig'},
        config = function()
            require('dim').setup({disable_lsp_decorations = true})
        end
    }

    -- Navigtion with tmux using HJKL
    use {'christoomey/vim-tmux-navigator'}

    -- Help code suggestion with github's Copilot
    -- Ma fen is gone, friendship now requires paying :(
    -- use {
    --     'zbirenbaum/copilot.lua',
    --     event = {'VimEnter'},
    --     config = function()
    --         vim.defer_fn(function()
    --             require('copilot').setup()
    --         end, 100)
    --     end
    -- }
    -- use {'zbirenbaum/copilot-cmp', module = 'copilot_cmp'}

    -- Code auto complete with luasnip as snippet's manager
    use {
        'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', 'onsails/lspkind-nvim', 'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }

    -- Collection of configurations for the built-in LSP client
    use {
        'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer', 'RRethy/vim-illuminate', {
            -- LSP status on bottom right of screen
            'j-hui/fidget.nvim',
            config = function()
                require'fidget'.setup {window = {blend = 0}}
            end
        }
    }

    -- use
    use {
        'mattn/emmet-vim',
        config = function()
            vim.cmd([[
              let g:user_emmet_leader_key=','
            ]])
        end
    }

    -- Rust support
    use {
        'simrat39/rust-tools.nvim',
        requires = {
            'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap',
            'alx741/vim-rustfmt'
        }
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
        requires = 'williamboman/nvim-lsp-installer',
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
        'numToStr/Comment.nvim',
        requires = 'JoosepAlviste/nvim-ts-context-commentstring',
        config = comment_config
    }

    -- Theme of nvim, transparent background
    use {
        'projekt0n/github-nvim-theme',
        requires = {'ray-x/lsp_signature.nvim'},
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

    -- For show location in lualine
    use {
        'SmiteshP/nvim-gps',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-gps').setup()
        end
    }

    -- Vim status line
    use {
        'nvim-lualine/lualine.nvim',
        after = 'github-nvim-theme',
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true}, 'ray-x/lsp_signature.nvim',
            'SmiteshP/nvim-gps'
        },
        config = lualine_config
    }

    -- Smooth scroll
    use {'karb94/neoscroll.nvim', config = scroll_config}

    -- Move block code
    use {'booperlv/nvim-gomove', config = gomove_config}

    -- Scrollbar with LSP support
    use {
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end
    }

    -- Auto forcus window
    -- use {
    --     'beauwilliams/focus.nvim',
    --     config = function()
    --         require('focus').setup({
    --             relativenumber = false,
    --             hybridnumber = false,
    --             cursorline = false,
    --             signcolumn = false,
    --             compatible_filetrees = {'neo-tree'},
    --             treewidth = 30
    --         })
    --     end
    -- }

    use {'roxma/nvim-yarp', run = 'pip install -r requirements.txt'}

    use {
        'gelguy/wilder.nvim',
        requires = {'roxma/nvim-yarp', 'roxma/vim-hug-neovim-rpc'},
        config = wilder_config
    }

    use {
        'andweeb/presence.nvim',
        config = function()
            require('presence'):setup({})
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({current_line_blame = true})
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            vim.opt.list = true
            require('indent_blankline').setup {
                space_char_blankline = ' ',
                show_current_context = true,
                show_current_context_start = true
            }
        end
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
        end
    }

    -- Discord activity
    use {
        'napmn/react-extract.nvim',
        config = function()
            require('react-extract').setup()
            vim.keymap.set({'v'}, '<Leader>re', require('react-extract').extract_to_new_file)
        end
    }

    use {
        'akinsho/toggleterm.nvim',
        tag = 'v1.*',
        config = function()
            require('toggleterm').setup()
        end
    }

    -- Work space management
    use {
        'natecraddock/workspaces.nvim',
        config = function()
            require('workspaces').setup({hooks = {open = {'BCloseAll'}}})
        end
    }
end)
