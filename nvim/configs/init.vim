set nocompatible "----------------------------------------------- Polygot Syntax

call plug#begin('~/.config/nvim/plugged')

" Tools
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "-------------- Fuzzy search
Plug 'junegunn/fzf.vim' "-----------------------------------------  Fuzzy search
Plug 'chengzeyi/fzf-preview.vim'
Plug 'psliwka/vim-smoothie' "------------------------------------- Smooth Scroll
Plug 'kyazdani42/nvim-web-devicons' "---------------------------- For file icons
" Plug 'kyazdani42/nvim-tree.lua' "------------------------------- Better NerdTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

Plug 'andymass/vim-matchup' "------------- Better % and highlight matching words
Plug 'rhysd/clever-f.vim' "-------------------------------- Make f more powerful
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }"--------- My Fucking theme
Plug 'pechorin/any-jump.vim' "-------------------------------------- Jump helper
Plug 'famiu/feline.nvim' "--------------------------------------- New status bar
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'Valloric/MatchTagAlways' "------- Always highlights the XML/HTML tags that enclose your cursor location
Plug 'zirrostig/vim-schlepp'
Plug 'airblade/vim-gitgutter'

" Frameworks
Plug 'MaxMEllon/vim-jsx-pretty' "----------------------------------------- React

" Faster code
Plug 'tmsvg/pear-tree' "------------------------------------- Auto pair brackets
Plug 'tpope/vim-surround' "--------------------------------------- Auto surround
Plug 'tpope/vim-commentary' "------------------------------- Comment code faster
Plug 'tpope/vim-repeat' "------------------------------ dot repeat with pluggins
Plug 'Yggdroot/indentLine' "---------------------------- Indent code with v-line
Plug 'wellle/targets.vim' "--------------------- Provides additional text object
Plug 'mg979/vim-visual-multi' "--------------------------------- Multiple Cursor
Plug 'mattn/emmet-vim' "------------------------------------------ Emmet for vim
Plug 'AndrewRadev/tagalong.vim' "------------------------------- Auto rename tag
Plug 'norcalli/nvim-colorizer.lua' "---------------------------- Colorize for FE

" Beauty code
Plug 'foosoft/vim-argwrap' "------ Wrap and unwrap function args, list, dicts...
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Ultils
Plug 'kyoz/ezbuf.vim' "------------------------------- Fast and easy use buffers
Plug 'kyoz/npm.vim' "-------------------------- Work with npm more easier in Vim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "-- Markdown
Plug 'christoomey/vim-tmux-navigator' "-------------------------- Vim and Tmux

" Performance
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end() "---------------------------------------- End of Vim-Plug define
