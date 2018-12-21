set background=dark
try
  let g:gruvbox_italic=1
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

" Make it easier to to spot the current paren
hi MatchParen cterm=bold ctermbg=none ctermfg=yellow

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
