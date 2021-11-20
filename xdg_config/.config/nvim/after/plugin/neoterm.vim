let g:neoterm_default_mod = 'botright'
let g:neoterm_autojump = 1
let g:neoterm_autoinsert = 1

augroup TermExtra
  autocmd!
  autocmd TermOpen * setlocal nonumber scrolloff=0
  autocmd FileType neoterm nmap <silent> <buffer> q :Tclose<CR>
augroup end

" TODO: This needs to be figured out
" Use gx{text-object} in normal mode
" nmap gr <Plug>(neoterm-repl-send)
" Send selected contents in visual mode.
" xmap gr <Plug>(neoterm-repl-send)

" Toggle neoterm pane
nmap <localleader>vv :Ttoggle<CR>
tmap <localleader>vv <c-\><c-n>:Ttoggle<CR>
