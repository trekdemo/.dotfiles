setlocal spell spelllang=en,hu
setlocal wrap linebreak
setlocal breakindent breakindentopt=shift:2
setlocal formatoptions=ln
setlocal concealcursor=

nnoremap <buffer> <silent> gP :!open -a 'Marked 2' '%'<cr>

nnoremap <buffer> <leader>zf :lua require('telekasten').find_notes()<CR>
" nnoremap <buffer> <leader>zd :lua require('telekasten').find_daily_notes()<CR>
" nnoremap <buffer> <leader>zg :lua require('telekasten').search_notes()<CR>
" nnoremap <buffer> <leader>zz :lua require('telekasten').follow_link()<CR>
" nnoremap <buffer> <leader>zt :lua require('telekasten').goto_today()<CR>
nnoremap <buffer> <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
" nnoremap <buffer> <leader>zn :lua require('telekasten').new_note()<CR>
nnoremap <buffer> <leader>zN :lua require('telekasten').new_templated_note()<CR>
nnoremap <buffer> <leader>zy :lua require('telekasten').yank_notelink()<CR>
nnoremap <buffer> <leader>zc :lua require('telekasten').show_calendar()<CR>
nnoremap <buffer> <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
" nnoremap <buffer> <leader>zt :lua require('telekasten').toggle_todo()<CR>

" we could define [[ in **insert mode** to call insert link
" inoremap [[ <ESC>:lua require('telekasten').insert_link()<CR>
" alternatively: leader [
  " inoremap <leader>[ <ESC>:lua require('telekasten').insert_link()<CR>
  " inoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>

  " the following are for syntax-coloring [[links]] and ==highlighted text==
  " (see the section about coloring in README.md)

  " colors suitable for gruvbox color scheme
  hi tkLink ctermfg=72 cterm=bold,underline
  hi tkBrackets ctermfg=gray

  " highlight ==highlighted== text
  hi tkHighlight ctermbg=yellow ctermfg=darkred cterm=bold

hi! VimwikiLink guifg=#89DDFF gui=underline
