if exists("g:neovide")
  " Font
  set guifont=JetBrainsMono\ Nerd\ Font:h14

  " FPS
  let g:neovide_refresh_rate=120

  " Background
  let g:neovide_transparency=0.0
  let g:transparency = 0.95
  let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

  " Floating window
  let g:neovide_floating_blur_amount_x = 2.0
  let g:neovide_floating_blur_amount_y = 2.0
 
  " Utilities
  let g:neovide_remember_window_size = v:true
  let g:neovide_input_use_logo=v:true
  let g:neovide_cursor_vfx_mode = "pixiedust"
  let g:neovide_cursor_antialiasing=v:true

  " MacOS Fix for system clipboard
  nmap <D-c> "+y
  vmap <D-c> "+y
  nmap <D-v> "+p
  inoremap <D-v> <c-r>+
  cnoremap <D-v> <c-r>+
  " use <D-r> to insert original character without triggering things like auto-pairs
  inoremap <D-r> <c-v>
endif
