augroup custom_autocommands
  autocmd!
  " Resize splits on window resize
  autocmd VimResized * wincmd =

  " Open quickfix window when it's populated
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow

  " Highlight yank
  autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=750 }

  " Only show cursorline in the active window
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup END

augroup folding_autocommands
  autocmd!
  " Don't screw up folds when inserting text that might affect them, until leaving
  " insert mode. Foldmethod is local to the window. Protect against screwing up
  " folding when switching between windows.
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

augroup CodeReloading
  autocmd!
  autocmd BufWritePost init.lua ++nested source <afile>
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
