" Remove perl provider
let g:loaded_perl_provider = 0

" Optimize vim yank, fix jump cursor
vnoremap y myy`y
vnoremap Y myY`y

let g:lsp_inlay_hints_enabled = 1
let g:lsp_inlay_hints_mode = {
\  'normal': ['always'],
\}

