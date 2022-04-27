local util = require('utils')

-- Keep the previous clipboard value
util.vnoremap('p', '"_dp')
-- Paste without overwriting default register (doesn't work with other registers)
util.xnoremap('p', 'pgvy')
-- Select the previously pasted text
util.nnoremap('gp', '`[v`]')
-- Alt + Backspace should delete the last word
util.inoremap("<A-BS>", "<C-W>")
util.cnoremap('<A-BS>', "<C-w>")

util.nnoremap('<A-s>', ':w<CR>')
util.inoremap('<A-s>', '<Esc>:w<CR>a')

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
util.noremap("<leader><leader>", "<Cmd>nohlsearch<Bar>diffupdate<CR>")

-- Open location-list and quickfix list
util.nnoremap('<leader>lo', ':lwindow<CR>')
util.nnoremap('<leader>co', ':cwindow<CR>')
util.nnoremap('<leader>cc', ':cclose<CR>')

-- Move lines in visual mode
util.vnoremap('J', ":m '>+1<CR>gv=gv")
util.vnoremap('K', ":m '<-2<CR>gv=gv")

-- Tab openning and closing
util.nnoremap('<leader>tc', ':tabclose<CR>')
util.nnoremap('<leader>tn', ':tabnew<CR>:Telescope find_files<CR>')

-- Shorcut for quick substitution
util.nnoremap('<leader>s', [[:%s///gc<left><left><left><left>]])
util.vnoremap('<leader>s', [[:%s/<c-r>//gc<left><left><left>]])

-- Quickly diffing to panes
util.nnoremap('<leader>dt', ':windo diffthis<CR>')
util.nnoremap('<leader>du', ':windo diffupdate<CR>')
util.nnoremap('<leader>do', ':windo diffoff<CR>')

-- Quickly search
util.nnoremap('<leader>A', ':lgrep! "FIXME\\|TODO"<CR>')
util.nnoremap('<leader>F', ':grep! <C-r><C-w><CR>')

-- Tab navigation
vim.keymap.set('n', '<TAB>', function ()
  if vim.fn.tabpagenr('$') > 1 then
    vim.cmd('tabnext')
  else
    vim.cmd('bnext')
  end
end)
vim.keymap.set('n', '<S-TAB>', function ()
  if vim.fn.tabpagenr('$') > 1 then
    vim.cmd('tabprevious')
  else
    vim.cmd('bprevious')
  end
end)


-- Window splitting and closing
util.nnoremap('<C-w>v', ':vsplit<CR>')
util.nnoremap('<C-w>s', ':split<CR>')

-- Window resizing
util.nnoremap('<C-w>>', '5<c-w>>')
util.nnoremap('<C-w><', '5<c-w><')
util.nnoremap('<C-w>+', '5<c-w>+')
util.nnoremap('<C-w>-', '5<c-w>-')
vim.keymap.set('n', '<A-Enter>', function ()
  local winWidth = vim.opt.columns._value
  local paneWidth = vim.fn.winwidth(0)
  if (winWidth - paneWidth) < 10 then
    vim.cmd "wincmd ="
  else
    vim.cmd "wincmd |"
    vim.cmd "wincmd _"
  end
end
)

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
