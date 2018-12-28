setlocal iskeyword+=?
setlocal foldmethod=syntax
let ruby_spellcheck_strings = 1

iabbrev <buffer> pry require 'pry'; binding.pry
