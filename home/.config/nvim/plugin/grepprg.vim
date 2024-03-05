" Use ripgrep or the_silver_searcher but grep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
elseif executable('ag')
  set grepprg=ag\ --vimgrep
endif
