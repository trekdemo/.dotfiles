nnoremap <buffer> q :q<CR>

setlocal wrap
setlocal nonumber
setlocal signcolumn=yes

wincmd J " Open quickfix always on the bottom

" Delete an item from the quickfix list
" https://stackoverflow.com/questions/42905008/quickfix-list-how-to-add-and-remove-entries
nnoremap <buffer> <silent> dd
  \ <Cmd>call setqflist(filter(getqflist(), {idx -> idx != line('.') - 1}), 'r') <Bar> cc<CR>
