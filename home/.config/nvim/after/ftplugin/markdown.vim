let g:markdown_fenced_languages = [ 'yaml', 'ruby', 'json', 'jsonc', 'sh', 'javascript', 'diff', 'python', 'mermaid' ]
setlocal spell spelllang=en,hu
setlocal textwidth=80
setlocal formatoptions=nbl " *fo-table*
setlocal wrap linebreak
" let &showbreak = '﬌ '
" let &showbreak = ''
setlocal breakindent breakindentopt=shift:-1,list:-1,sbr
setlocal conceallevel=2 concealcursor=

" nnoremap <buffer> <silent> gP :!open -a 'Marked 2' '%'<cr>
nnoremap <buffer> <silent> gP :!open -a 'iA Writer' '%'<cr>
nmap <buffer> <silent> ss ]s

" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
nmap <M-p> <Plug>MarkdownPreviewToggle
