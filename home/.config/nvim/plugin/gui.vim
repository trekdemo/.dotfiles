set guifont=VictorMono\ Nerd\ Font:h15

if exists("g:neovide")
  " Put anything you want to happen only in Neovide here
  let g:neovide_hide_mouse_when_typing = v:true
  let g:neovide_input_use_logo=v:true
  let g:neovide_input_macos_alt_is_meta=v:true
  let g:neovide_cursor_animation_length=0.02
  let g:neovide_cursor_trail_size = 0.15
  let g:neovide_cursor_vfx_mode = ""
  " let g:neovide_cursor_vfx_mode = "pixiedust"
endif
