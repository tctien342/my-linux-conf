return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  -- Bind support for autopairs
  use {
    'windwp/nvim-autopairs', --------------------- Add support for auto pairs
    requires = { 'nvim-treesitter/nvim-treesitter', 'hrsh7th/nvim-cmp' },
    config = require('configs.autopairs')
  }

  -- Treesitter for highlight syntax, language compatible
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag', ----------------------- Support auto tag for html
      'JoosepAlviste/nvim-ts-context-commentstring', -- Better comment block code
      'p00f/nvim-ts-rainbow' -------------------------- Add rainbow color for code pair
    },
    run = ':TSUpdate',
    config = require('configs.treesister')
  }

  -- Navigtion between screen and tmux using HJKL
  use {
    'christoomey/vim-tmux-navigator'
  }

  use {
    -- Setup built-in LSP
    'neovim/nvim-lspconfig',
    -- Auto download language server
    'williamboman/mason.nvim',
    "williamboman/mason-lspconfig.nvim",
  }

  -- For nvim toast
  use { 'rcarriga/nvim-notify', config = require('configs.notify') }

  use {
    'hrsh7th/nvim-cmp', -------------------- UI Completion
    'hrsh7th/cmp-nvim-lsp', ---------------- Nvim LSP binding
    'hrsh7th/cmp-buffer', ------------------ Buffer completion
    'hrsh7th/cmp-path', -------------------- Path Completion
    'onsails/lspkind-nvim', ---------------- Vscode style in completion
    'hrsh7th/cmp-nvim-lua', ---------------- Completion for Nvim lua API
    'f3fora/cmp-spell', -------------------- Spell suggestion
    'lukas-reineke/cmp-under-comparator', -- Better completion's sorting
    'hrsh7th/cmp-cmdline', ----------------- Bind completion into vim cmd
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
    run = { 'pip3 install black isort flake8 mypy' }
  }

  use {
    'mattn/emmet-vim', -------------------- Emmet support for NVIM
    config = function()
      vim.g.user_emmet_leader_key = ','
    end
  }

  use {
    'simrat39/rust-tools.nvim', ---------- Rust workplace,
    'alx741/vim-rustfmt', ---------------- Using RustFtm for code formating
    requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' }
  }

  use {
    'akinsho/flutter-tools.nvim', -------- Flutter workplace
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require 'flutter-tools'.setup { widget_guides = { enabled = true } }
    end
  }

  use {
    'windwp/nvim-spectre', --------------- Better searcher, like Vscode
    requires = 'nvim-lua/plenary.nvim',
    config = function() require 'spectre'.setup {} end
  }

  use {
    'folke/trouble.nvim', --------------- Lsp warning and error support tool
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require 'trouble'.setup {} end
  }

  use({
    'glepnir/lspsaga.nvim', ------------- Bind extra feature into LSP
    branch = 'main',
    config = require('configs.lspsaga'),
    requires = { {"nvim-tree/nvim-web-devicons"} }
  })

  use {
    'ray-x/lsp_signature.nvim', ------------------- Function's signature information
    config = function()
      require 'lsp_signature'.setup {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        hint_enable = true,
        fix_pos = false,
        auto_close_after = 3,
        floating_window = true,
        handler_opts = { border = 'single' }
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim', -------------- File search, text search, buffer search...
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = require('configs.telescope')
  }

  use {
    'nvim-telescope/telescope-ui-select.nvim', ------ Code action for telescope
    requires = { 'nvim-telescope/telescope.nvim' }
  }

  use {
    'prettier/vim-prettier', -------------------------- Code formatter for common language
    run = 'npm i && npm i prettier-plugin-solidity'
  }

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require('configs.explorer')
  }

  -- Fast delete buffer LeaderBX and LeaderBS
  use 'kyoz/ezbuf.vim'

  -- Multiple cursor with Ctrl-N
  use 'mg979/vim-visual-multi'

  -- Better comment block of codes
  use {
    'numToStr/Comment.nvim',
    requires = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = require('configs.comment')
  }

  use {
    'nyoom-engineering/oxocarbon.nvim',
    requires = { 'ray-x/lsp_signature.nvim' },
    config = require('configs.theme')
  }

  -- Color highlighter
  use {
    'NvChad/nvim-colorizer.lua',
    config = function() require 'colorizer'.setup { mode = "virtualtext", css = true } end
  }

  -- Buffer tabs
  use {
    'akinsho/bufferline.nvim',
    config = require('configs.bufferline')
  }

  -- Bottom line status
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('configs.lualine')
  }

  -- Smooth scrolling support
  use {
    'karb94/neoscroll.nvim',
    config = require('configs.scroll')
  }

  -- Support for moving block code
  use {
    'booperlv/nvim-gomove',
    config = function() require('gomove').setup {} end
  }

  -- Add scrollbar in file
  use {
    'petertriho/nvim-scrollbar',
    config = function() require('scrollbar').setup {} end
  }

  -- Better space and tab visual
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = require('configs.indent')
  }

  -- Jump around buffer with go word(gw) and go line(gl)
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function() require 'hop'.setup {} end
  }

  -- Add support for terminal, quick open with ctrl-t and <index>-ctrl-t
  use {
    'akinsho/toggleterm.nvim',
    config = function() require('toggleterm').setup {} end
  }

  -- Add support for multiple workspace
  use {
    'natecraddock/workspaces.nvim',
    config = function()
      require('workspaces').setup { hooks = { open = { 'BCloseAll' } } }
    end
  }

  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = require('configs.copilot')
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function() require("copilot_cmp").setup {
        method = "getCompletionsCycling",
      }
    end
  }
end)
