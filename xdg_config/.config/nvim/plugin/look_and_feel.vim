" Make it easier to to spot the current paren
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow
" Hilight the line number of the cursorline
hi clear CursorLine
hi clear CursorLineNr
hi CursorLineNr cterm=bold  ctermfg=Yellow
" Make the search highlights a bit less intrusive
hi Search cterm=underline,bold ctermfg=Yellow

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component': {
    \   'lineinfo': '%l:%v',
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'spell' ],
    \             [ 'gitbranch' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'filetype' ] ]
    \ },
    \ 'component_function': {
    \    'filename': 'LightLineFilename',
    \    'gitbranch': 'LightlineFugitive'
    \ }
    \ }

" Component functions {{{
function! LightLineFilename()
  return expand('%')
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
" }}}
