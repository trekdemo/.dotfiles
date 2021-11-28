local util = require('utils')

-- Keep the previous clipboard value
util.vnoremap('p', '"_dp')
-- Paste without overwriting default register (doesn't work with other registers)
util.xnoremap('p', 'pgvy')
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
util.nnoremap('<Up>', 'gk')
util.nnoremap('<Down>', 'gj')

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
util.nnoremap('<C-w>>', '5<c-w>>')
util.nnoremap('<C-w><', '5<c-w><')
util.nnoremap('<C-w>+', '5<c-w>+')
util.nnoremap('<C-w>-', '5<c-w>-')

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

-- " Mappings: Command-line {{{
-- " Some helpers to edit mode http://vimcasts.org/e/14
util.cnoremap('%%', [[<C-R>=fnameescape(expand('%:h')).'/'<cr>]])
-- " Emacs bindings in command line mode
util.cnoremap('<c-a>', '<home>')
util.cnoremap('<c-e>', '<end>')
-- " }}}
