-- Keep the previous clipboard value
vim.keymap.set('v', 'p', '"_dp', {desc = "Paste (keep clipboard)"})
-- Paste without overwriting default register (doesn't work with other registers)
vim.keymap.set('x', 'p', 'pgvy')
-- Select the previously pasted text
vim.keymap.set('n', 'gp', '`[v`]')
-- Alt + Backspace should delete the last word
vim.keymap.set({'i', 'c', 't'}, '<M-BS>', '<C-w>')

-- Use Esc to get into command mode with Esc
vim.keymap.set('n', '<Esc>', ':')

-- Save buffer
vim.keymap.set('n', '<M-s>', ':w<CR>', {desc = 'Save file'})
vim.keymap.set('i', '<M-s>', '<Esc>:w<CR>a', {desc = 'Save file'})

-- Delete buffer
vim.keymap.set('n', '<C-x>', ':bd<CR>')

-- Don't move on *
vim.keymap.set('n', '*', '*Nzzzv')
-- Don't move on J - line join
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep search matches in the middle of the window and pulse the line when moving to them.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Easier to type, and I never use the default behavior.
vim.keymap.set({'n', 'v', 'o'}, 'H', '^')
vim.keymap.set({'n', 'v', 'o'}, 'L', 'g_')
vim.keymap.set({'n', 'v', 'o'}, '<Home>', '^')
vim.keymap.set({'n', 'v', 'o'}, '<End>', '$')

-- Have relative jumps in the jump list (bigger than 5)
vim.keymap.set('n', 'j', [[(v:count > 5 ? "m'" . v:count : "") . 'gj']], { expr = true })
vim.keymap.set('n', 'k', [[(v:count > 5 ? "m'" . v:count : "") . 'gk']], { expr = true })
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', '<Down>', 'gj')

-- Undo breakpoints
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')
vim.keymap.set('i', '[', '[<c-g>u')
vim.keymap.set('i', ']', ']<c-g>u')
vim.keymap.set('i', '(', '(<c-g>u')
vim.keymap.set('i', ')', ')<c-g>u')
vim.keymap.set('i', '{', '{<c-g>u')
vim.keymap.set('i', '}', '}<c-g>u')

-- Open location-list and quickfix list
vim.keymap.set('n', '<leader>lo', ':lwindow<CR>')
vim.keymap.set('n', '<leader>co', ':cwindow<CR>')
vim.keymap.set('n', '<leader>cc', ':cclose<CR>')

-- Move lines in visual mode
vim.keymap.set('v', '<C-k>', ":move '<-2<CR>gv=gv", {desc = 'Move line up'})
vim.keymap.set('v', '<C-j>', ":move '>+1<CR>gv=gv", {desc = 'Move line down'})
vim.keymap.set('n', '<C-k>', ":move .-2<CR>==", {desc = 'Move line up'})
vim.keymap.set('n', '<C-j>', ":move .+1<CR>==", {desc = 'Move line down'})

-- Tab openning and closing
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>:Telescope find_files<CR>')

-- Shorcut for quick substitution
vim.keymap.set('n', '<leader>s', [[:%s///gc<left><left><left><left>]], {desc = 'Replace in file'})

-- Quickly diffing to panes
vim.keymap.set('n', '<leader>dt', ':windo diffthis<CR>')
vim.keymap.set('n', '<leader>du', ':windo diffupdate<CR>')
vim.keymap.set('n', '<leader>do', ':windo diffoff<CR>')

-- Quickly search
vim.keymap.set('n', '<leader>F', ':grep! <C-r><C-w><CR>', {desc = 'Grep <cword>'})

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
vim.keymap.set('n', '<C-w>v', ':vsplit<CR>')
vim.keymap.set('n', '<C-w>s', ':split<CR>')

-- Window resizing
vim.keymap.set('n', '<M-S-Right>', '5<c-w>>', {desc = 'Grow width by 5'})
vim.keymap.set('n', '<M-S-Left>', '5<c-w><', {desc = 'Shrink width by 5'})
vim.keymap.set('n', '<M-S-Up>', '5<c-w>+', {desc = 'Grow height by 5'})
vim.keymap.set('n', '<M-S-Down>', '5<c-w>-', {desc = 'Shrink height by 5'})
vim.keymap.set('n', '<A-Enter>', function ()
  local threshold = 10
  local winWidth = vim.opt.columns._value
  local winHeight = vim.opt.lines._value
  local paneWidth = vim.fn.winwidth(0)
  local paneHeight = vim.fn.winheight(0)

  if (winWidth - paneWidth) < threshold and (winHeight - paneHeight) < threshold then
    vim.cmd "wincmd ="
  else
    vim.cmd "wincmd |"
    vim.cmd "wincmd _"
  end
end
  , {desc = 'Toggle maximise window'})

-- Scroll faster
vim.keymap.set({ 'n', 'v' }, '<C-y>', '2<C-y>', {desc = 'Scroll up'})
vim.keymap.set({ 'n', 'v' }, '<C-e>', '2<C-e>', {desc = 'Scroll down'})
vim.keymap.set({ 'n', 'v' }, '<PageUp>', '2<C-y>')
vim.keymap.set({ 'n', 'v' }, '<PageDown>', '2<C-e>')

vim.keymap.set('n', '[oc', ':set conceallevel=2 <CR>')
vim.keymap.set('n', ']oc', ':set conceallevel=0 <CR>')

vim.keymap.set('n', 'zf', 'zMzvzz', {desc = 'Focus on current fold'})

-- " Mappings: Command-line {{{
-- " Some helpers to edit mode http://vimcasts.org/e/14
vim.keymap.set('c', '%%', [[<C-R>=fnameescape(expand('%:h')).'/'<cr>]])

-- =============================================================================
-- " Emacs bindings
-- https://www.johndcook.com/blog/emacs_move_cursor/
vim.keymap.set('c', '<C-a>', '<Home>', {desc = 'Beginning line'})
vim.keymap.set('c', '<C-e>', '<End>', {desc = 'End line'})
vim.keymap.set('i', '<C-f>', '<Right>', {desc = 'Next char'})
vim.keymap.set('i', '<C-b>', '<Left>', {desc = 'Previous char'})
vim.keymap.set('i', '<M-f>', '<C-o>w', {desc = 'Next word'})
vim.keymap.set('i', '<M-b>', '<C-o>b', {desc = 'Previous word'})
vim.keymap.set('i', '<C-u>', '<esc>gUiwea', {desc = 'Upcase last word'})
