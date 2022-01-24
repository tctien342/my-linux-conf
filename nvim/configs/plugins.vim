" NVIMTree {{{

" Mappings
lua require'nvim-tree'.setup()
noremap <Leader>t :NvimTreeToggle<CR> "----------------------------- NERDTree Toggle

" }}}

" COLORS SOLARIZED {{{
set t_Co=256
syntax on
set termguicolors     " enable true colors support
colorscheme aquarium
let g:aqua_transparency = 1
let g:aquarium_style="dark"

"}}}

" TELEScope {{{

nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader><leader> <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

" PRETTIER {{{

au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
let g:prettier#exec_cmd_path = "/Users/saintno/.nvm/versions/node/v14.16.1/bin/prettier"
let g:prettier#exec_cmd_async= 1

" }}}

" VIM-MATCHUP {{{

let g:matchup_matchpref = {}
let g:matchup_matchpref.html = {'tagnameonly': 1}

" }}}

" VIM-EMMET {{{

let g:user_emmet_leader_key=','

" }}}

" Disable COQ remap default
let g:coq_settings = { "auto_start": v:true, "keymap.jump_to_mark": "<c-q>" }

lua require'colorizer'.setup()

" Transparent background
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE

