setlocal iskeyword+=?
let ruby_spellcheck_strings = 1

iabbrev <buffer> pry require 'pry'; binding.pry

" Gary Bernhardt's hashrocket
inoremap <buffer> <c-l> <space>=><space>
