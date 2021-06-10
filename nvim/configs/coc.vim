" Config for Coc

set pumheight=5 "--------------------------------- limit autocomple candidates

set hidden "------------------------- if hidden is not set, TextEdit might fail.
set shortmess+=c "------------------- don't give |ins-completion-menu| messages.
set updatetime=300 "------------ smaller updatetime for CursorHold & CursorHoldI
set cmdheight=2 "----------------------------------- better display for messages
set signcolumn=yes "------------------------------------ always show signcolumns

hi CocErrorSign  ctermfg=Red guifg=#f2323f
hi CocWarningSign  ctermfg=Brown guifg=#37cdfa
hi CocInfoSign  ctermfg=Yellow guifg=#fcb017
hi CocHintSign  ctermfg=Blue guifg=#0083e0

" Install coc extensions
if match(&rtp, 'coc.nvim') >= 0
    let s:languages = [
        \ 'coc-html',
        \ 'coc-css',
        \ 'coc-tsserver',
        \ 'coc-docker',
        \ 'coc-gocode',
        \ 'coc-java',
        \ 'coc-json',
        \ 'coc-phpls',
        \ 'coc-python',
        \ 'coc-rls',
        \ 'coc-vimtex',
        \ 'coc-vimlsp',
        \ 'coc-svg',
        \ 'coc-sh',
        \ 'coc-svg',
        \ ]

    let s:frameworks = [
        \ 'coc-vetur',
        \ 'coc-vimlsp',
        \ ]

    let s:linters = [
        \ 'coc-stylelintplus',
        \ 'coc-eslint',
        \ 'coc-diagnostic',
        \ ]

    let s:utils = [
        \ 'coc-syntax',
        \ 'coc-dictionary',
        \ 'coc-lists',
        \ 'coc-tag',
        \ 'coc-emoji',
        \ 'coc-github',
        \ 'coc-snippets',
        \ 'coc-calc',
        \ 'coc-emmet',
        \ 'coc-prettier',
        \ 'coc-yank'
        \ ]

    let s:extensions = s:languages + s:frameworks + s:linters + s:utils

    let g:coc_global_extensions = s:extensions

    if exists('g:did_coc_loaded')
        call coc#add_extension()
    end
endif


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> gR <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-diagnostic-prev)
nmap <silent> gE <Plug>(coc-diagnostic-next)
nmap <silent> ga :CocAction<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
" imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <C-j>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Fold
let javascript_fold=1
let typescript_fold=1

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

