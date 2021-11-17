setlocal spell nonumber wrap linebreak breakindent formatoptions=ln
set breakindent
set breakindentopt=shift:2

let g:markdown_fenced_languages = ['yaml', 'ruby', 'json', 'sh', 'javascript']

nmap <buffer> <silent> - :Ex<cr>
nmap <buffer> <silent> <localleader>p :!open -a 'Marked 2' '%'<cr>

autocmd FileType lua lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'luasnip' },
\     { name = 'spell' },
\     { name = 'buffer' },
\     { name = 'path' },
\   },
\ }
