if exists("g:neovide")
  set guifont=JetBrainsMono\ Nerd\ Font:h14
  let g:neovide_refresh_rate=120
  let g:neovide_transparency=0.8
  let g:neovide_input_use_logo=v:true
  let g:neovide_remember_window_size = v:true
  let g:neovide_cursor_vfx_mode = "pixiedust"
  let g:neovide_cursor_antialiasing=v:true
  " MacOS Fix
  " system clipboard
  nmap <D-c> "+y
  vmap <D-c> "+y
  nmap <D-v> "+p
  inoremap <D-v> <c-r>+
  cnoremap <D-v> <c-r>+
  " use <D-r> to insert original character without triggering things like auto-pairs
  inoremap <D-r> <c-v>
endif
