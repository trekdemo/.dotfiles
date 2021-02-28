setlocal nonumber
setlocal textwidth=80
setlocal wrap
setlocal conceallevel=2

syntax match todoCheckbox '\[\ \]' conceal cchar=○
syntax match todoCheckbox '[\-\*]\s*\[\ \]' conceal cchar=○
syntax match todoCheckbox '[\-\*]\s*\[X\]' conceal cchar=◌
syntax match todoCheckbox '[\-\*]\s*\[[.oO]\]' conceal cchar=●

noremap <buffer> <C-p> :Files ~/Documents/Notes<CR>
noremap <buffer> <localleader>t :VimwikiSearchTags<space>
nnoremap <buffer> <localleader>gt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr>
nnoremap <buffer> <localleader>bl :VimwikiBacklinks<cr>
