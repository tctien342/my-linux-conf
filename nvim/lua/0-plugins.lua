local autopairs_config = require('configs.autopairs')
local treesitter_config = require('configs.treesister')
local bufferline_config = require('configs.bufferline')
local explorer_config = require('configs.explorer')
local scroll_config = require('configs.scroll')
local lualine_config = require('configs.lualine')
local telescope_config = require('configs.telescope')
local theme_config = require('configs.theme')
local comment_config = require('configs.comment')
local lspsaga_config = require('configs.lspsaga')
local notify_config = require('configs.notify')

return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  use {
    'windwp/nvim-autopairs', --------------------- Add support for auto pairs
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = autopairs_config
  }

  use {
    'nvim-treesitter/nvim-treesitter', ------------------ Treesitter for highlight syntax, language compatible
    requires = {
      'windwp/nvim-ts-autotag', ----------------------- Support auto tag for html
      'JoosepAlviste/nvim-ts-context-commentstring', -- Better comment block code
      'p00f/nvim-ts-rainbow' -------------------------- Add rainbow color for code pair
    },
    run = ':TSUpdate',
    config = treesitter_config
  }

  use {
    'm-demare/hlargs.nvim', ----------------------------- Support for highlight function args
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use {
    "narutoxy/dim.lua",
    requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
  }

  use {
    'christoomey/vim-tmux-navigator' ----- Navigtion between screen and tmux using HJKL
  }

  use {
    'neovim/nvim-lspconfig', ------------- Setup built-in LSP
    'williamboman/nvim-lsp-installer' ---- Auto download language server
  }

  use { 'rcarriga/nvim-notify', config = notify_config }

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
    config = function()
      require 'spectre'.setup {}
    end
  }

  use {
    'folke/trouble.nvim', --------------- Lsp warning and error support tool
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'trouble'.setup {}
    end
  }

  use({
    'glepnir/lspsaga.nvim', ------------- Bind extra feature into LSP
    branch = 'main',
    config = lspsaga_config
  })

  use {
    'ray-x/lsp_signature.nvim', ------------------- Function's signature information
    requires = 'williamboman/nvim-lsp-installer',
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
    config = telescope_config
  }

  use {
    'nvim-telescope/telescope-ui-select.nvim', ------ Code action for telescope
    requires = { 'nvim-telescope/telescope.nvim' }
  }

  use {
    'prettier/vim-prettier', -------------------------- Code formatter for common language
    run = 'npm i && npm i prettier-plugin-solidity'
  }

  use {
    'kyazdani42/nvim-tree.lua', ----------------------- File Explorer
    requires = {
      'kyazdani42/nvim-web-devicons' ---------------- Support icons
    },
    config = explorer_config
  }

  use 'kyoz/ezbuf.vim' ---------------------------------- Fast delete buffer LeaderBX and LeaderBS
  use 'mg979/vim-visual-multi' -------------------------- Multiple cursor with Ctrl-N

  use {
    'numToStr/Comment.nvim', -------------------------- Better comment block of codes
    requires = 'JoosepAlviste/nvim-ts-context-commentstring',
    config = comment_config
  }

  use {
    'folke/tokyonight.nvim',
    requires = { 'ray-x/lsp_signature.nvim' },
    config = theme_config
  }

  use {
    'rrethy/vim-hexokinase', ------------------------- Color review tool
    run = 'make hexokinase',
    config = function()
      vim.cmd [[
       let g:Hexokinase_highlighters = ['foregroundfull']
     ]]
    end
  }

  use {
    'akinsho/bufferline.nvim', ----------------------- Buffer tabs
    config = bufferline_config
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }

  use {
    'nvim-lualine/lualine.nvim', ---------------------- Bottom line status
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true }, 'ray-x/lsp_signature.nvim',
      'SmiteshP/nvim-navic'
    },
    config = lualine_config
  }

  use {
    'karb94/neoscroll.nvim', ------------------------- Smooth scrolling support
    config = scroll_config
  }

  use {
    'booperlv/nvim-gomove', ------------------------- Support for moving block code
    config = function()
      require('gomove').setup {}
    end
  }

  use {
    'petertriho/nvim-scrollbar', -------------------- Add scrollbar in file
    config = function()
      require('scrollbar').setup {}
    end
  }

  use {
    'andweeb/presence.nvim', ----------------------- Support for Discord status
    config = function()
      require('presence'):setup {}
    end
  }

  use {
    'lewis6991/gitsigns.nvim', --------------------- Add git info into buffer, AKA gitlens in vscode
    config = function()
      require('gitsigns').setup { current_line_blame = true }
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim', --------- Better space and tab visual
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append 'space:⋅'
      require('indent_blankline').setup {
        space_char_blankline = ' ',
        show_current_context = true,
        show_current_context_start = true
      }
    end
  }

  use {
    'phaazon/hop.nvim', ---------------------------- Jump around buffer with go word(gw) and go line(gl)
    branch = 'v2',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use {
    'akinsho/toggleterm.nvim', --------------------- Add support for terminal, quick open with ctrl-t and <index>-ctrl-t
    config = function()
      require('toggleterm').setup {}
    end
  }

  use {
    'natecraddock/workspaces.nvim', ---------------- Add support for multiple workspace
    config = function()
      require('workspaces').setup { hooks = { open = { 'BCloseAll' } } }
    end
  }

  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup({
          panel = { keymap = { open = "<C-CR>" } },
          suggestion = { auto_trigger = true, keymap = { accept = "<C-a>" } }
        })
      end, 100)
    end,
  }
end)
