" @saintno neovim configuration

" CONFIG'S SOURCES {{{
    runtime vim/0.general.vim "---- General vim config
    runtime vim/1.neovide.vim "---- Neovide specifict config
    runtime vim/2.etc.vim "-------- Other configs
" }}}

" LUA CONFIGURATION {{{
    lua require('0-plugins') ------ Plugins managerment
    lua require('1-completion') --- Nvim completation
    lua require('2-lsp') ---------- LSP Installation
    lua require('3-binding') ------ Keybinding
    lua require('4-etc') ---------- Other configuration
" }}}
