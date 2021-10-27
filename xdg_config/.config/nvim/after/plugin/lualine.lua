-- Usage and customization
-- https://github.com/nvim-lualine/lualine.nvim#usage-and-customization
require('lualine').setup({
  options = {theme = 'gruvbox_dark'},
})



-- Previous configuration for lightline
-- let g:lightline = {
--     \ 'colorscheme': 'gruvbox',
--     \ 'component': {
--     \   'lineinfo': '%l:%v',
--     \ },
--     \ 'active': {
--     \   'left': [ [ 'mode', 'paste', 'spell' ],
--     \             [ 'gitbranch' ],
--     \             [ 'readonly', 'filename', 'modified' ] ],
--     \   'right': [ [ 'lineinfo' ],
--     \              [ 'filetype' ] ]
--     \ },
--     \ 'component_function': {
--     \    'filename': 'LightLineFilename',
--     \    'gitbranch': 'LightlineFugitive'
--     \ }
--     \ }

-- let g:lightline.mode_map = {
--     \ 'n' : 'N',
--     \ 'i' : 'I',
--     \ 'R' : 'R',
--     \ 'v' : 'V',
--     \ 'V' : 'V-L',
--     \ "\<C-v>": 'V-B',
--     \ 'c' : 'C',
--     \ 's' : 'S',
--     \ 'S' : 'S-L',
--     \ "\<C-s>": 'S-B',
--     \ 't': 'T',
--     \ }
-- " Component functions {{{
-- function! LightLineFilename()
--   return expand('%')
-- endfunction

-- function! LightlineFugitive()
--   if exists('*fugitive#head')
--     let branch = fugitive#head()
--     return branch !=# '' ? ' '.branch : ''
--   endif
--   return ''
-- endfunction
-- " }}}
