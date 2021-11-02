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
-- vim.cmd [[
--   augroup GruvboxCustomizations
--     autocmd!
--     " Transparent background
--     autocmd ColorScheme gruvbox  hi Normal      guibg=NONE ctermbg=NONE
--                              \ | hi EndOfBuffer guibg=NONE ctermbg=NONE
--                              \ | hi VertSplit   guibg=NONE ctermbg=NONE
--   augroup END
-- ]]
vim.cmd [[colorscheme gruvbox]]

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
opt.foldmethod = 'manual'
opt.foldtext = "folding#text()"

-- Completion
opt.complete = table.concat(vim.opt.complete, "kspell")
opt.completeopt = { "menu", "menuone", "noselect" }
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

-- Keep the previous clipboard value
util.vnoremap('p', '"_dp')
-- Paste without overwriting default register (doesn't work with other registers)
util.xnoremap('p', 'pgvy')
-- Select the previously pasted text
util.nnoremap('gp', '`[v`]')
-- Select the previously pasted text
util.nnoremap('gp', '`[v`]')
-- Alt + Backspace should delete the last word
util.inoremap("<A-BS>", "<C-W>")
-- Yank from cursor till the end of the line - Behave like all the other capital letters
util.nnoremap('Y', 'y$')

-- Don't move on *
util.nnoremap('*', '*Nzzzv')
-- Don't move on J - line join
util.nnoremap('J', 'mzJ`z')

-- Keep search matches in the middle of the window and pulse the line when moving to them.
util.nnoremap('n', 'nzzzv')
util.nnoremap('N', 'Nzzzv')

-- Easier to type, and I never use the default behavior.
util.noremap('H', '^')
util.noremap('L', 'g_')

-- Have relative jumps in the jump list (bigger than 5)
util.nnoremap('j', [[(v:count > 5 ? "m'" . v:count : "") . 'gj']], { expr = true })
util.nnoremap('k', [[(v:count > 5 ? "m'" . v:count : "") . 'gk']], { expr = true })

-- Undo breakpoints
util.inoremap(',', ',<c-g>u')
util.inoremap('.', '.<c-g>u')
util.inoremap('!', '!<c-g>u')
util.inoremap('?', '?<c-g>u')
util.inoremap(';', ';<c-g>u')
util.inoremap('[', '[<c-g>u')
util.inoremap(']', ']<c-g>u')
util.inoremap('(', '(<c-g>u')
util.inoremap(')', ')<c-g>u')
util.inoremap('{', '{<c-g>u')
util.inoremap('}', '}<c-g>u')

-- Remove selected highlight
util.noremap("<leader><leader>", ":nohlsearch<cr>:call clearmatches()<CR>")

-- Edit and source vimrc file
util.nnoremap('<leader>ev', ':vsplit $MYVIMRC<CR>')

-- Open location-list and quickfix list
util.nnoremap('<leader>lo', ':lwindow<CR>')
util.nnoremap('<leader>co', ':cwindow<CR>')

-- Move lines in visual mode
util.vnoremap('J', ":m '>+1<CR>gv=gv")
util.vnoremap('K', ":m '<-2<CR>gv=gv")

-- Tab openning and closing
util.nnoremap('<leader>tc', ':tabclose<CR>')
util.nnoremap('<leader>tn', ':tabnew<CR>:Telescope find_files<CR>')

-- Shorcut for quick substitution
util.nnoremap('<leader>s', [[:%s///gc<left><left><left><left>]])
util.vnoremap('<leader>s', [[:%s/<c-r>//gc<left><left><left>]])

-- Window splitting and closing
util.nnoremap('<C-w>v', ':vsplit<CR>')
util.nnoremap('<C-w>s', ':split<CR>')

-- Quickly diffing to panes
util.nnoremap('<leader>dt', ':windo diffthis<CR>')
util.nnoremap('<leader>du', ':windo diffupdate<CR>')
util.nnoremap('<leader>do', ':windo diffoff<CR>')

-- Quickly search
util.nnoremap('<leader>A', ':lgrep! "FIXME\\|TODO"<CR>')
util.nnoremap('<leader>F', ':grep! <C-r><C-w><CR>')

-- Tab navigation
util.nnoremap('<TAB>', 'gt')
util.nnoremap('<S-TAB>', 'gT')

-- Window resizing
util.nnoremap('<C-S-left>', '5<c-w>>')
util.nnoremap('<C-S-right>', '5<c-w><')
util.nnoremap('<C-S-up>', '5<c-w>+')
util.nnoremap('<C-S-down>', '5<c-w>-')

-- Scroll faster
util.nnoremap('<C-e>', '3<C-e>')
util.nnoremap('<C-y>', '3<C-y>')

-- Upcase last word
util.inoremap('<C-u>', '<esc>gUiwea')

util.nnoremap('[oc', ':set conceallevel=2 <CR>')
util.nnoremap(']oc', ':set conceallevel=0 <CR>')

-- Mappings: Folding {{{
-- Use zf to "focus" the current fold.
util.nnoremap('zf', 'zMzvzz')

vim.cmd [[
  augroup folding_autocommands
    autocmd!
    " Don't screw up folds when inserting text that might affect them, until leaving
    " insert mode. Foldmethod is local to the window. Protect against screwing up
    " folding when switching between windows.
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
  augroup END
]]
-- }}}

vim.cmd [[

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
