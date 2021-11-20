-- The runs on the very first time a vim installation is used
if require("geri.first_run")() then
  return
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require "geri.globals"

-- Load and configure plugins
require "plugins"

local opt = vim.opt

-- Colorscheme
opt.termguicolors = true
opt.background = "dark"

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
opt.relativenumber = true
opt.numberwidth = 6
opt.cursorline = false

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
opt.complete = ".,w,b,u,t,kspell"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10
opt.pumblend = 10

-- Settings
opt.hidden = true -- Edited files can be in hidden buffers
opt.ignorecase = true
opt.smartcase = true
opt.diffopt = "filler,internal,algorithm:histogram,indent-heuristic,iwhite"
opt.virtualedit = 'block' -- Allow to move the cursor everywhere,
opt.list = true -- Show invisible characters not just existing text
opt.listchars = "tab:⇥ ,trail:·,extends:❯,precedes:❮"
opt.fillchars="diff:╱,vert:│,foldclose:,foldopen:,eob: " -- Comment needed to allow empty eob char
opt.conceallevel = 2
opt.concealcursor = "nc" -- Don't show hidden characters in normal mode
opt.inccommand = "nosplit" -- Show substitution in realtime
opt.clipboard = {'unnamed', "unnamedplus" }

local util = require('utils')

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
util.nnoremap('<TAB>', ':BufferLineCycleNext<CR>')
util.nnoremap('<S-TAB>', ':BufferLineCyclePrev<CR>')

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

  -- " Mappings: Command-line {{{
  -- " Some helpers to edit mode http://vimcasts.org/e/14
  util.cnoremap('%%', [[<C-R>=fnameescape(expand('%:h')).'/'<cr>]])
  -- " Emacs bindings in command line mode
  util.cnoremap('<c-a>', '<home>')
  util.cnoremap('<c-e>', '<end>')
  -- " }}}

vim.cmd [[
  " Autocommands: General {{{
  " Open quickfix window when it's populated
  augroup custom_autocommands
    autocmd!
    autocmd VimResized * wincmd =
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
  augroup END

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END
  " }}}

  " Terminal {{{
  let g:neoterm_default_mod = 'botright'
  let g:neoterm_autojump = 1
  let g:neoterm_autoinsert = 1

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
]]


vim.cmd([[
augroup InitLuaReload
  autocmd!
  autocmd BufWritePost init.lua ++nested source <afile>
augroup end
]])
