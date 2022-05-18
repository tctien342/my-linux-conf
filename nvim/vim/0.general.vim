let mapleader = " " "----------------------------------------------------------- Setting leader key
set pumheight=6 "--------------------------------------------------------------- limit autocomple candidates
set completeopt=longest,menu,noselect "----------------------------------------- Setup for CMP completion

set guioptions-=m "-------------------------------------------- Remove menu bar
set guioptions-=T "--------------------------------------------- Remove toolbar
set guioptions-=r "------------------------------- Remove right-hand scroll bar
set guioptions-=L "-------------------------------- Remove left-hand scroll bar

set nowrap "------------------------------------------ Single row, no break line
set nocompatible "--------------------------------------------- For Nvim Polygot
set colorcolumn=0 "-------------------------------------------- line column show
set nospell "-------------------------------------------------- Disable spelling
set title "-------------------------------------- Let vim set the terminal title
set updatetime=100 "-------------------------------- Redraw the status bar often
set list "--------------------------------------------- Show trailing whitespace
set showcmd "--------------------------------------- Display incomplete commands
set laststatus=2 "-------------------------------------- Always show status line
set showtabline=2 "----------------------------------------- Always show tabline
set display+=lastline "--------------------- As must as possible of the lastline
set previewheight=3 "------------------------------------ Smaller preview height
set relativenumber "------------------------------------- Show relative number
set signcolumn=yes "------------------------------------- Fix diagnostic sign jumping in number bar
set splitright  "---------------------------------- Fix nvim-tree not fixed left


set relativenumber "------------------------------------- Show relative number
set termguicolors "--------------------------------------- True color for neovim
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endif

set noswapfile "------------------------------------------ Dont create wrap file
set nobackup "------------------------------------------------- Dont save backup
filetype plugin on "--------------------------------------------- Turn on plugin
set backspace=indent,eol,start "----------------- Allow backspace in insert mode

" PYTHON PROVIDERS {{{

  if has('macunix')
    " OSX
    let g:python3_host_prog = '/usr/local/bin/python3' "---------- Set python 3 provider
    let g:python_host_prog = '/usr/local/bin/python2' "-------------- Set python 2 provider
  elseif has('unix')
    " Ubuntu
    let g:python3_host_prog = '/usr/bin/python3' "---------- Set python 3 provider
    let g:python_host_prog = '/usr/bin/python' "-------------- Set python 2 provider
  elseif has('win32') || has('win64')
    " Window
  endif
  
  " }}}

if has('mouse')
    set mouse=a "----------------------------- Allow use mouse, possible in nvim
endif

set clipboard+=unnamedplus "------------------------------------- Enable clipboard
