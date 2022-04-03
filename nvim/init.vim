" @saintno neovim configuration

" CONFIG'S SOURCES {{{
    runtime vim/0.general.vim
" }}}

" LUA CONFIGURATION {{{
    lua require('plugins')
    lua require('completion')
    lua require('lsp')
" }}}
