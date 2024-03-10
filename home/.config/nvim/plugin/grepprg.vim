" Use ripgrep or the_silver_searcher but grep
if executable('ag')
  set grepprg=ag\ --vimgrep
elseif executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif
