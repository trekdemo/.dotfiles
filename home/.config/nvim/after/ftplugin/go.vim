inoremap <buffer> <c-l> <space>:=<space>

" Disable the mapping of K to :GoDoc
" https://github.com/fatih/vim-go/issues/140
let g:go_doc_keywordprg_enabled = 0

" https://vimways.org/2018/death-by-a-thousand-files/
setlocal path+=/opt/homebrew/Cellar/go/*/libexec/src
setlocal suffixesadd+=.go
setlocal include=^\s*\<\(import\>\)
setlocal define=^\s*func
