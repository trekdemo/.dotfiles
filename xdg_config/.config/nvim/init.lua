local g = vim.g
local opt = vim.opt

local util = require('utils')

g.mapleader = util.t"<Space>"
g.maplocalleader = util.t"<Bslash>"

-- Load and configure plugins
require('plugins')

-- Colorscheme
opt.termguicolors = true
opt.background = "dark"
vim.cmd [[
  augroup GruvboxCustomizations
    autocmd!
    " Transparent background
    autocmd ColorScheme gruvbox  hi Normal      guibg=NONE ctermbg=NONE
                             \ | hi EndOfBuffer guibg=NONE ctermbg=NONE
                             \ | hi VertSplit   guibg=NONE ctermbg=NONE
  augroup END
  colorscheme gruvbox
]]

-- Spelling should be disabled by default
-- when enabled use English and only the 9 best suggestions
opt.spell = false
opt.spelllang = "en"
opt.spellsuggest = "best,9"

-- Mouse
opt.mouse = "a"

-- Command line behaviour
opt.showmode = false -- Don't display -- INSERT -- in status line
opt.cmdheight = 1

-- Text flow
opt.wrap = false
opt.textwidth = 80
opt.expandtab = true
opt.shiftround = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- Line numbers
opt.number = true
opt.numberwidth = 6
opt.cursorline = true

-- Scroll behaviour
opt.scrolloff = 5
opt.sidescroll = 1
opt.sidescrolloff = 2

-- Splits
opt.splitright = true -- New split window on the right
opt.splitbelow = true -- New split window on the bottom

-- Folds
opt.foldenable = true
opt.foldlevel = 999999
opt.foldlevelstart = 10
opt.foldtext = "folding#text()"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Completion
opt.complete = table.concat(vim.opt.complete, "kspell")
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10
opt.pumblend = 10

-- Settings
opt.hidden = true -- Edited files can be in hidden buffers
opt.ignorecase = true
opt.smartcase = true
opt.diffopt = "filler,internal,algorithm:histogram,indent-heuristic,iwhite"
opt.virtualedit = table.concat(vim.opt.virtualedit, "block") -- Allow to move the cursor everywhere,
opt.list = true -- Show invisible characters not just existing text
opt.listchars = "tab:⇥ ,trail:·,extends:❯,precedes:❮"
opt.fillchars="diff:⣿,vert:│,eob: " -- Comment needed to allow empty eob char
opt.conceallevel = 2
opt.concealcursor = "nc" -- Don't show hidden characters in normal mode
opt.inccommand = "nosplit" -- Show substitution in realtime
opt.clipboard = table.concat(vim.opt.clipboard, "unnamedplus")

vim.cmd [[
  " Mappings: General {{{
  " Keep the previous clipboard value
  vnoremap p "_dP
  " Paste without overwriting default register (doesn't work with other registers)
  xnoremap p pgvy
  " Select the previously pasted text
  nnoremap gp `[v`]
  " Alt + Backspace should delete the last word
  inoremap <A-BS> <C-W>
  " Yank from cursor till the end of the line - Behave like all the other capital letters
  nnoremap Y y$

  " Don't move on *
  nnoremap * *Nzzzv
  " Don't move on J
  nnoremap J mzJ`z

  " Keep search matches in the middle of the window and pulse the line when moving to them.
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Easier to type, and I never use the default behavior.
  noremap H ^
  noremap L g_

  " Have relative jumps in the jump list (bigger than 5)
  nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'gj'
  nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'gk'

  " Undo breakpoints
  inoremap , ,<c-g>u
  inoremap . .<c-g>u
  inoremap ! !<c-g>u
  inoremap ? ?<c-g>u
  inoremap ; ;<c-g>u
  inoremap [ [<c-g>u
  inoremap ] ]<c-g>u
  inoremap ( (<c-g>u
  inoremap ) )<c-g>u
  inoremap { {<c-g>u
  inoremap } }<c-g>u

  " Remove selected highlight
  noremap <leader><leader> :nohlsearch<cr>:call clearmatches()<cr>:echo 'Search cleared'<CR>

  " Edit and source vimrc file
  nnoremap <leader>ev :vsplit $MYVIMRC<CR>

  " Open location-list and quickfix list
  nnoremap <leader>lo :lwindow<CR>
  nnoremap <leader>co :cwindow<CR>

  " Wrapping words/selections with (, [, {, ", ', ', ", }, ], )
  " Using vim-surround
  nmap <leader>( viWS(
  vmap <leader>( S(
  nmap <leader>) viWS)
  vmap <leader>) S)

  nmap <leader>[ viWS[
  vmap <leader>[ S[
  nmap <leader>] viWS]
  vmap <leader>] S]

  nmap <leader>{ viWS{
  vmap <leader>{ S{
  nmap <leader>} viWS}
  vmap <leader>} S}

  nmap <leader>" viwS"
  vmap <leader>" S"
  nmap <leader>' viwS'
  vmap <leader>' S'

  " Move lines in visual mode
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '<-2<CR>gv=gv

  " Shorcut for quick substitution
  nnoremap <leader>s :%s//gc<left><left><left>
  vnoremap <leader>s :%s/<c-r>//gc<left><left><left>

  " Tab openning and closing
  nnoremap <leader>tc :tabclose<CR>
  nnoremap <leader>tn :tabnew<CR>

  " Window splitting and closing
  nnoremap <C-w>v :vsplit<CR>
  nnoremap <C-w>s :split<cr>
  nnoremap gF :e <cfile><cr>

  " Quickly diffing to panes
  nnoremap <leader>dt :windo diffthis<CR>
  nnoremap <leader>du :windo diffupdate<CR>
  nnoremap <leader>do :windo diffoff<CR>

  " Comment out lines with Commentarney
  nmap <leader>/ <Plug>CommentaryLine
  xmap <leader>/ <Plug>Commentary
  omap <leader>/ <Plug>Commentary

  " Quickly search
  nnoremap <leader>A :lgrep! "FIXME\\|TODO"<CR>
  nnoremap <leader>F :grep! <C-r><C-w><CR>

  " Tab navigation
  nnoremap <TAB> gt
  nnoremap <S-TAB> gT

  " Window resizing
  nnoremap <C-left> 5<c-w>>
  nnoremap <C-right> 5<c-w><
  nnoremap <C-up> 5<c-w>+
  nnoremap <C-down> 5<c-w>-

  " Scrolling
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>

  " Upcase last word
  inoremap <C-u> <esc>gUiwea

  nnoremap [oc :set conceallevel=2 <CR>
  nnoremap ]oc :set conceallevel=0 <CR>
  " }}}

  " Mappings: Folding {{{
  " Use ,z to "focus" the current fold.
  nnoremap zf zMzvzz
  " }}}

  " Mappings: Command-line {{{
  " Some helpers to edit mode http://vimcasts.org/e/14
  cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
  " Emacs bindings in command line mode
  cnoremap <c-a> <home>
  cnoremap <c-e> <end>
  " }}}

  " Autocommands: General {{{
  " Open quickfix window when it's populated
  augroup custom_autocommands
    autocmd!
    autocmd VimResized * wincmd =
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
    " Open quickfix always on the bottom
    autocmd FileType qf wincmd J
    autocmd FileType qf setlocal wrap
  augroup END

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
  " }}}

  " Autocommands: Folding {{{
  augroup folding_autocommands
    autocmd!
    " Don't screw up folds when inserting text that might affect them, until leaving
    " insert mode. Foldmethod is local to the window. Protect against screwing up
    " folding when switching between windows.
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
  augroup END
  " }}}

  " Terminal {{{
  let g:neoterm_default_mod = 'vertical'
  let g:neoterm_autojump = 1
  let g:neoterm_autoinsert = 0

  augroup TermExtra
    autocmd!
    autocmd TermOpen * setlocal nonumber scrolloff=0
    autocmd FileType neoterm nmap <silent> <buffer> q :quit!<CR>
  augroup end


  " Use gx{text-object} in normal mode
  " nmap gr <Plug>(neoterm-repl-send)
  " Send selected contents in visual mode.
  " xmap gr <Plug>(neoterm-repl-send)

  " Toggle neoterm pane
  nmap <localleader>vv :Ttoggle<CR>
  tmap <localleader>vv <c-\><c-n>:Ttoggle<CR>
  " }}}

  " Plugin: floating-preview.nvim {{{
  set completeopt-=preview
  let g:float_preview#docked = 0
  let g:float_preview#max_width = 30
  " }}}

  " Plugin: Eunuch {{{
  cabbrev rename Rename
  cabbrev move Move
  cabbrev mkdir Mkdir!
  " }}}

  " Plugin: vim-test {{{
  nmap <silent> t<C-l> :TestLast<CR>
  nmap <silent> t<C-g> :TestVisit<CR>

  nmap t<C-n> :TestNearest<CR>
  nmap t<C-f> :TestFile<CR>
  nmap t<C-s> :TestSuite<CR>
  nmap t<S-n> :TestNearest -strategy=vimux<CR>
  nmap t<S-f> :TestFile -strategy=vimux<CR>
  nmap t<S-s> :TestSuite -strategy=vimux<CR>

  function! RunInBashTransform(cmd) abort
    return "bash --login -c '".a:cmd."'"
  endfunction

  let g:test#custom_transformations = {
    \ 'bash': function('RunInBashTransform'),
    \ }
  " let g:test#transformation = 'bash'
  let test#strategy = {
    \ 'nearest': 'dispatch',
    \ 'file':    'dispatch',
    \ 'suite':   'dispatch',
    \ }
  let test#ruby#rspec#options = '--format progress'
  " }}}

  " Plugin: vim-dispatch {{{
  " When Dispatch tries to recognize the compiler plugin it matches the command
  " with makeprg name. Some commands have prefixes that prevent the proper
  " matching.
  let g:dispatch_compilers = {
    \ 'bash --login -c ': '',
    \ }
  " }}}

  " Plugin: VimWiki {{{
  let g:vimwiki_auto_header = 1
  let g:vimwiki_markdown_link_ext = 1
  let g:vimwiki_filetypes = ['markdown']
    " \     'custom_wiki2html': '~/bin/wiki2html',
  let g:vimwiki_list = [
    \   {
    \     'path': '~/Documents/Notes/',
    \     'path_html': '~/Public/Wiki/',
    \     'custom_wiki2html': $HOME.'/.config/nvim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh',
    \     'syntax': 'markdown',
    \     'ext': '.md',
    \     'auto_diary_index': 1,
    \     'auto_tags': 1,
    \     'auto_toc': 1,
    \     'links_space_char': '-'
    \   }
    \ ]
  " }}}
]]
