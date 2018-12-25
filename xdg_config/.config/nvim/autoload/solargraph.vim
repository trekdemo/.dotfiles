function! solargraph#startInTmux()
  VimuxRunCommand('solargraph socket&')
  sleep 1 " Wait for server to start
  echom 'solargraph started in the background'
endfunction
