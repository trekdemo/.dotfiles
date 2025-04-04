function! VimuxSlime()
  call VimuxSendKeys("q C-u")
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

let g:VimuxDebug = v:false
let g:VimuxUseNearest = v:true
" let g:VimuxRunnerName = 'vimux'
" let g:VimuxRunnerQuery = {
"   \ 'pane': '{down-of}',
"   \ 'window': 'vimux',
"   \}

" Key mappings
nnoremap <Leader>vp :VimuxPromptCommand<CR>
nnoremap <Leader>v<C-l> :VimuxClearTerminalScreen<CR>
nnoremap <Leader>vc :VimuxClearRunnerHistory<CR>
nnoremap <Leader>vC :VimuxCloseRunner<CR>
nnoremap <Leader>vz :VimuxZoomRunner<CR>
nnoremap <Leader>vi :VimuxInspectRunner<CR>
vnoremap <Leader>vs "vy :call VimuxSlime()<CR>
nnoremap <Leader>vs vip<LocalLeader>vs<CR>
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
