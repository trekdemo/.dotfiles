set background=dark
try
  let g:gruvbox_italic=1
  colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \    'filename': 'LightLineFilename',
    \    'cocstatus': 'coc#status',
    \    'gitbranch': 'LightlineFugitive'
    \ }
    \ }
function! LightLineFilename()
  return expand('%')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    return fugitive#head()
  endif
  return ''
endfunction
