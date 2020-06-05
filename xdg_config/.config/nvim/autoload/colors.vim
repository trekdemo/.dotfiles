function! colors#isDark() abort
  return $COLOR_MODE == 'dark'
endfunction

function! colors#init() abort
  set termguicolors " Enables 24-bit RGB color in the TUI

  if colors#isDark()
    echom 'Switching to DARK mode...'
    call colors#switchToDark()
  else
    echom 'Switching to LIGHT mode...'
    call colors#switchToLigth()
  endif
endfunction

function! colors#lightlineTheme() abort
  if colors#isDark()
    return 'gruvbox'
  else
    return 'papercolor'
  endif
endfunction

function! colors#switchToDark()
  set background=dark
  let g:gruvbox_italic=1
  colorscheme gruvbox

  " Better highlight the matching parans
  highlight MatchParen cterm=bold ctermbg=none ctermfg=yellow guibg=none guifg=yellow

  " Give a slight highlight for buffer content
  hi clear ColorColumn
  hi ColorColumn ctermbg=234 guibg=#1d2021
  hi SignColumn ctermbg=234 guibg=#1d2021
  hi VertSplit ctermbg=234 guibg=#1d2021
  hi EndOfBuffer  ctermbg=234 guibg=#1d2021

  " Hilight the line number of the cursorline
  hi clear CursorLine
  hi CursorLine ctermbg=234 guibg=#1d2021
  hi clear CursorLineNr
  hi CursorLineNr cterm=bold gui=bold ctermbg=234 ctermfg=Yellow guibg=#1d2021

  " Make the search highlights a bit less intrusive
  hi clear Search
  hi Search cterm=underline,bold ctermfg=Yellow gui=underline,bold guifg=Yellow
endfunction

function! colors#switchToLigth()
  set background=light
  let g:pencil_terminal_italics = 1
  colorscheme pencil
endfunction
