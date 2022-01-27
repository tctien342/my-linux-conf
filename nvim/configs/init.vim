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
Plug 'pechorin/any-jump.vim' "-------------------------------------- Jump helper
Plug 'akinsho/bufferline.nvim'

Plug 'nvim-lualine/lualine.nvim' "---------------------------------- Status line
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'matze/vim-move'
Plug 'airblade/vim-gitgutter'
Plug 'sunjon/shade.nvim' "--------------------------------------- Dim inactive w
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

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
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'weilbith/nvim-code-action-menu'

" Beauty complete
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'

" Language pack
Plug 'SmiteshP/nvim-gps'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end() "---------------------------------------- End of Vim-Plug define
