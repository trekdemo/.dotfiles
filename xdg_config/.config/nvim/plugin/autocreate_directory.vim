" Create directory if it does not exists
function! s:Mkdir()
  let dir = expand('%:p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction

augroup plugin_mkdir
  autocmd!
  autocmd BufWritePre * call s:Mkdir()
augroup END
