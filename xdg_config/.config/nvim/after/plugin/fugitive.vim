cabbrev g Git
" Open file for diff in new tab and jump to the first change
nnoremap <leader>gd <C-w>s<C-w>T:Gdiff<cr>zRgg]c
nnoremap <leader>gs :Git<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gco :GBranches<cr>
nnoremap <leader>gci :Git commit<cr>
noremap <silent> <leader>gl :GV<CR>
noremap <silent> <leader>dg :diffget<CR>
noremap <silent> <leader>dp :diffput<CR>
