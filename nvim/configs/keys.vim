" GENERAL {{{

let mapleader = "\<Space>" 
let maplocalleader = "\\"

" Use black hole for delete. Don't want to store in register with dd.
" For cut, use visual and x instead
nnoremap d "_d
vnoremap d "_d

" also for yank
" replace currently selected text with default register without yanking it
vnoremap <leader>p "_dP

" Save all buffers
nnoremap <leader>w :wa<CR>
" }}}

" BUFFER MOTIONS {{{
nnoremap gB :bprevious <CR> 
nnoremap gb :bnext <CR>
" }}}

" USEFUL {{{

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}

" DISABLED {{{

" Disable Ctrl-Z
nnoremap <c-z> <NOP>

" Disable ex mode
nnoremap Q <Nop>

" }}}

" WINDOW RESIZE {{{

if bufwinnr(1)
  noremap <silent> <C-H> :vertical resize -4<CR>
  noremap <silent> <C-L> :vertical resize +4><CR>
  noremap <silent> <C-J> :resize -4<CR>
  noremap <silent> <C-K> :resize +4<CR>
endif

" }}}

"------- MORE CUSTOMIZE
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>
nnoremap <C-tab> :tabedit<CR>
nnoremap <C-e> !!$SHELL<CR>
" nnoremap gf :PrettierAsync<CR>
nnoremap gs :w<CR>
nnoremap gf :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gt :BufferLinePick<CR>

"------- Move block code
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

"------- Fix list
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

"------- Hack paste
xnoremap p "0p
nnoremap p "0p
