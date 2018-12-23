" Create directory if it does not exists
function! s:Mkdir()
  if &diff " Do not create fugitve files
    return
  endif

  let dir = expand('%:p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echom 'Created non-existing directory: '.dir
  endif
endfunction

augroup plugin_mkdir
  autocmd!
  autocmd BufWritePre * call s:Mkdir()
augroup END
