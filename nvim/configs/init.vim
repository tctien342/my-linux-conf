set nocompatible "----------------------------------------------- Polygot Syntax

call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'kyazdani42/nvim-web-devicons' "---------------------------- For file icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'psliwka/vim-smoothie' "------------------------------------- Smooth Scroll
Plug 'andymass/vim-matchup' "------------- Better % and highlight matching words
Plug 'akinsho/bufferline.nvim'

Plug 'nvim-lualine/lualine.nvim' "---------------------------------- Status line
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'booperlv/nvim-gomove'
Plug 'airblade/vim-gitgutter'
Plug 'EdenEast/nightfox.nvim'

" Faster code
Plug 'windwp/nvim-autopairs' "------------------------------- Auto pair brackets
Plug 'tpope/vim-surround' "--------------------------------------- Auto surround
Plug 'terrortylor/nvim-comment' "---------------------------- Comment code faster
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mg979/vim-visual-multi' "--------------------------------- Multiple Cursor
Plug 'mattn/emmet-vim' "------------------------------------------ Emmet for vim
Plug 'windwp/nvim-ts-autotag' "------------------------------- Auto rename tag
Plug 'norcalli/nvim-colorizer.lua' "---------------------------- Colorize for FE

" Ultils
Plug 'kyoz/ezbuf.vim' "------------------------------- Fast and easy use buffers
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "-- Markdown
Plug 'christoomey/vim-tmux-navigator' "-------------------------- Vim and Tmux

" LSP Performance
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/symbols-outline.nvim' "------------------------------ Outline symbols

" Specific platform
Plug 'akinsho/flutter-tools.nvim'

" Code action
Plug 'MunifTanjim/nui.nvim'
Plug 'CosmicNvim/cosmic-ui'

" Beauty complete
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'

" Language pack
Plug 'SmiteshP/nvim-gps'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" CODEPILOT
Plug 'github/copilot.vim'

call plug#end() "---------------------------------------- End of Vim-Plug define
