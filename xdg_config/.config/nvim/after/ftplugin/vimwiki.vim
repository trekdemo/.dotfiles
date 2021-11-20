setlocal spell spelllang=en,hu
setlocal nonumber
setlocal textwidth=80
setlocal wrap
setlocal conceallevel=2

syntax match todoCheckbox '\[\ \]' conceal cchar=○
syntax match todoCheckbox '[\-\*]\s*\[\ \]' conceal cchar=○
syntax match todoCheckbox '[\-\*]\s*\[X\]' conceal cchar=◌
syntax match todoCheckbox '[\-\*]\s*\[[.oO]\]' conceal cchar=●

nnoremap <buffer> <leader>ff <cmd>Telescope find_files cwd=~/Documents/Notes<cr>
nnoremap <buffer> <localleader>t :VimwikiSearchTags<space>
nnoremap <buffer> <localleader>gt :VimwikiRebuildTags!<cr>:VimwikiGenerateTagLinks<cr>
nnoremap <buffer> <localleader>bl :VimwikiBacklinks<cr>
