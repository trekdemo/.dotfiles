setlocal iskeyword+=?
setlocal foldmethod=syntax
let ruby_spellcheck_strings = 1

iabbrev <buffer> pry require 'pry'; binding.pry

" gary bernhardt's hashrocket
inoremap <buffer> <c-l> <space>=><space>

" ,# Surround a word with #{ruby interpolation}
nmap <leader># viw<leader>#
vmap <leader># c#{<C-R>"}<ESC>

" Formatting
" setlocal formatprg=rubocop\ --fix-layout
" setlocal formatprg=rubocop\ --fix-layout\ --stdin\ %\ \|sed\ '1,/====================/d'
" augroup ruby-fmt
"   autocmd!
"   autocmd BufWritePre <buffer> normal gggqG``
" augroup END
