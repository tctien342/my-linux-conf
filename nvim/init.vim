" @saintno neovim configuration

" CONFIG'S SOURCES {{{
    runtime vim/0.general.vim
    runtime vim/1.neovide.vim
" }}}

" LUA CONFIGURATION {{{
    lua require('0-plugins')
    lua require('1-completion')
    lua require('2-lsp')
    lua require('3-binding')
" }}}
