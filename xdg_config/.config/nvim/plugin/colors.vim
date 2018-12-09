set background=dark
try
  colorscheme gruvbox
  let g:gruvbox_italic=1
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \    'filename': 'LightLineFilename',
    \    'cocstatus': 'coc#status'
    \ }
    \ }
function! LightLineFilename()
  return expand('%')
endfunction
