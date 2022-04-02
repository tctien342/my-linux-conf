" NVIMTree {{{

" Mappings
lua require'nvim-tree'.setup()
noremap <Leader>t :NvimTreeToggle<CR> "----------------------------- NERDTree Toggle
noremap <Leader>r :NvimTreeRefresh<CR> "--------------------------- NERDTree Refresh

" }}}

" COLORS SOLARIZED {{{
syntax on
set termguicolors     " enable true colors support
colorscheme onedark

"}}}

" TELEScope {{{

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>j <cmd>Telescope grep_string<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader><leader> <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" }}}

" FZF.VIM {{{

" Just ignore .git folders
" command! -bang -nargs=? -complete=dir DefaultFiles
"   \ call fzf#run({'source': 'ag --hidden --skip-vcs-ignores --ignore .git -g ""'})

" " Mappings
" nmap <leader>f        :GFiles<cr>
" nmap <leader>s        :FZFAg<cr>
" nmap <leader>F        :DefaultFiles<cr>
" nmap <leader>l        :BLines<cr>
" nmap <leader>L        :Ag<cr>
" nmap <leader><leader> :Buffers<cr>
" nmap <leader>c        :Commits<cr>
" nmap <leader>a        :Ag<cr>

" " Use o to open candidate in quickfix window
" autocmd BufReadPost quickfix nnoremap <buffer> o <CR>

" " Action mappings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" " In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.8 } }
" let g:fzf_history_dir = '~/.local/share/fzf-history'

" " Hide statusline when open fzf
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" }}}

" INDENT LINE {{{

let g:indentLine_char = '┆'

augroup indentLine_config
    autocmd!
    autocmd InsertEnter *.json setlocal concealcursor=
    autocmd InsertLeave *.json setlocal concealcursor=inc
augroup END

" }}}

" TREE PAIRS {{{

let g:pear_tree_pairs = {
  \ '(':    {'closer': ')'},
  \ '[':    {'closer': ']'},
  \ '{':    {'closer': '}'},
  \ "'":    {'closer': "'"},
  \ '"':    {'closer': '"'},
  \ '/*':   {'closer': '*/'},
  \ '<!--': {'closer': '-->'}
  \ }

let g:pear_tree_repeatable_expand = 0

" }}}

" AIRWRAP {{{

nnoremap <silent> gw :ArgWrap<CR>

" }}}

" MARKDOWN SYNTAX {{{

autocmd FileType markdown let g:indentLine_enabled=0 " Prevent markdown side effect
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0

" }}}

" MARDOWN-PREVIEW {{{

nmap <leader>m <Plug>MarkdownPreviewToggle

" }}}

" VIM-MATCHUP {{{

let g:matchup_matchpref = {}
let g:matchup_matchpref.html = {'tagnameonly': 1}

" }}}

" VIM-EMMET {{{

let g:user_emmet_leader_key=','

" }}}
"
" VIM-MOVE {{{

nmap <S-h> <Plug>GoNSMLeft
nmap <S-j> <Plug>GoNSMDown
nmap <S-k> <Plug>GoNSMUp
nmap <S-l> <Plug>GoNSMRight

xmap <S-h> <Plug>GoVSMLeft
xmap <S-j> <Plug>GoVSMDown
xmap <S-k> <Plug>GoVSMUp
xmap <S-l> <Plug>GoVSMRight

nmap <C-h> <Plug>GoNSDLeft
nmap <C-j> <Plug>GoNSDDown
nmap <C-k> <Plug>GoNSDUp
nmap <C-l> <Plug>GoNSDRight

xmap <C-h> <Plug>GoVSDLeft
xmap <C-j> <Plug>GoVSDDown
xmap <C-k> <Plug>GoVSDUp
xmap <C-l> <Plug>GoVSDRight

" }}}

" ALE {{{

" let g:ale_linters = {
" \   'solidity': ['solhint'],
" \}
" let g:ale_linters_explicit = 1

" }}}

" Float Terminal {{{

" Floaterm settings
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
" Autoclose if job exited normally, otherwise stay open (0 open, 2 close)
let g:floaterm_autoclose = 1
" Open terminal with F4
let g:floaterm_keymap_toggle = 'tt'
let g:floaterm_keymap_new    = 'tn'
let g:floaterm_keymap_prev   = 'th'
let g:floaterm_keymap_next   = 'tl'
noremap tt :FloatermToggle<CR>
noremap tfr :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=debug --position=topright --autoclose=2<CR>
noremap th :FloatermPrev<CR>
noremap tl :FloatermNext<CR>
noremap tn :FloatermNew<CR>

" Open file manager (ranger) with F3
nnoremap <silent> <F3> :FloatermNew ranger<CR>
" Exit terminal mode with Esc (I don't normally use Esc in terminal)
tnoremap <Esc> <C-\><C-n>
" Send Esc to terminal with "verbatim" C-v
tnoremap <C-v><Esc> <Esc>

" }}}



noremap <Leader>a :SymbolsOutline<CR> "----------------------------- Outline Toggle
noremap gp :Prettier<CR> "----------------------------- Formating use prettier
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" Transparent background
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Floaterm guibg=NONE

