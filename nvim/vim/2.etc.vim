" Remove perl provider
let g:loaded_perl_provider = 0

" Optimize vim yank, fix jump cursor
vnoremap y myy`y
vnoremap Y myY`y
