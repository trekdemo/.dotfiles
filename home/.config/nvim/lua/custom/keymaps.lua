local vim = vim

vim.keymap.set('n', '<leader>l<space>', ':Lazy ', { desc = 'Lazy' })

-- Better defaults
vim.keymap.set('n', 'Q', '<nop>')
-- Keep the previous clipboard value
vim.keymap.set('v', 'p', '"_dp', { desc = 'Paste (keep clipboard)' })
-- Paste without overwriting default register (doesn't work with other registers)
vim.keymap.set('x', 'p', 'pgvy')
-- Select the previously pasted text
vim.keymap.set('n', 'gp', '`[v`]')
-- Alt + Backspace should delete the last word
vim.keymap.set({ 'i', 'c', 't' }, '<M-BS>', '<C-w>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Save the current buffer if modifiable
vim.keymap.set('n', '<C-s>', function()
  vim.cmd.write()
end, { desc = 'Save file' })

-- Delete every buffer except the current one
vim.cmd 'command! BufOnly silent! execute "%bd|e#|bd#"'
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>')

-- Delete buffer
vim.keymap.set('n', '<C-x>', ':bd<CR>')

-- Don't move on *
vim.keymap.set('n', '*', '*Nzzzv')
-- Center current line on <C-l>
-- vim.keymap.set('n', '<C-l>', '<C-l>zz10<C-e>')
-- Don't move on J - line join
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep search matches in the middle of the window and pulse the line when moving to them.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Easier to type, and I never use the default behavior.
vim.keymap.set({ 'n', 'v', 'o' }, 'H', '^')
vim.keymap.set({ 'n', 'v', 'o' }, 'L', 'g_')
vim.keymap.set({ 'n', 'v', 'o' }, '<Home>', '^')
vim.keymap.set({ 'n', 'v', 'o' }, '<End>', '$')

-- Have relative jumps in the jump list (bigger than 5)
vim.keymap.set('n', 'j', [[(v:count > 5 ? "m'" . v:count : "") . 'gj']], { expr = true, silent = true })
vim.keymap.set('n', 'k', [[(v:count > 5 ? "m'" . v:count : "") . 'gk']], { expr = true, silent = true })
vim.keymap.set('n', '<Up>', 'gk', { silent = true })
vim.keymap.set('n', '<Down>', 'gj', { silent = true })

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
vim.keymap.set('n', '<leader>lc', ':lclose<CR>')
vim.keymap.set('n', '<leader>co', ':copen<CR>')
vim.keymap.set('n', '<leader>cO', ':Copen!<CR>') -- Load the unfiltered output from the last Dispatch
vim.keymap.set('n', '<leader>cc', ':cclose<CR>')

-- Move lines in visual mode
vim.keymap.set('v', '[e', ":move '<-2<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set('v', ']e', ":move '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('n', '[e', ':move .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('n', ']e', ':move .+1<CR>==', { desc = 'Move line down' })

-- Tab openning and closing
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<leader>tt', ':tabnew<CR>:Telescope find_files<CR>')

-- Shorcut for quick substitution
vim.keymap.set('n', '<leader>ss', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<left><left><left>]], { desc = 'Replace in file' })

-- Quickly diffing to panes
vim.keymap.set('n', '<leader>dt', ':windo diffthis<CR>')
vim.keymap.set('n', '<leader>du', ':windo diffupdate<CR>')
vim.keymap.set('n', '<leader>do', ':windo diffoff<CR>')
-- Diff and Merge mappings
vim.keymap.set('n', '<leader>dp', ':diffput<CR>')
vim.keymap.set('n', '<leader>dg', ':diffget<CR>')
vim.keymap.set('n', '<leader>dgh', '<cmd>diffget //2<cr>', { desc = 'Get the hunk in the left' })
vim.keymap.set('n', '<leader>dgl', '<cmd>diffget //3<cr>', { desc = 'Get the hunk in the right' })

-- Quickly search
vim.keymap.set('n', '<leader>F', ':grep! <C-r><C-w><CR>', { desc = 'Grep <cword>' })

-- Tab navigation
vim.keymap.set('n', '<TAB>', function()
  if vim.fn.tabpagenr '$' > 1 then
    vim.cmd 'tabnext'
  else
    vim.cmd 'bnext'
  end
end)
vim.keymap.set('n', '<S-TAB>', function()
  if vim.fn.tabpagenr '$' > 1 then
    vim.cmd 'tabprevious'
  else
    vim.cmd 'bprevious'
  end
end)

-- Window splitting and closing
vim.keymap.set('n', '<C-w>v', ':vsplit<CR>')
vim.keymap.set('n', '<C-w>s', ':split<CR>')

-- Window resizing
vim.keymap.set('n', '<M-S-Right>', '5<c-w>>', { desc = 'Grow width by 5' })
vim.keymap.set('n', '<M-S-Left>', '5<c-w><', { desc = 'Shrink width by 5' })
vim.keymap.set('n', '<M-S-Up>', '5<c-w>+', { desc = 'Grow height by 5' })
vim.keymap.set('n', '<M-S-Down>', '5<c-w>-', { desc = 'Shrink height by 5' })

vim.keymap.set('n', '[oc', ':set conceallevel=2 <CR>')
vim.keymap.set('n', ']oc', ':set conceallevel=0 <CR>')

-- Add blank line in normal mode
-- https://vim.fandom.com/wiki/Quickly_adding_and_deleting_empty_lines#:~:text=Starting%20in%20normal%20mode%2C%20you,cursor%20type%2010O%20.
vim.cmd [[
nnoremap <silent>]<space> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent>[<space> :set paste<CR>m`O<Esc>``:set nopaste<CR>
]]

-- Fold mappings
vim.keymap.set('n', 'zf', 'zMzvzz', { desc = 'Focus on current fold' })

-- " Mappings: Command-line {{{
-- " Some helpers to edit mode http://vimcasts.org/e/14
vim.keymap.set('c', '%%', [[<C-R>=fnameescape(expand('%:h')).'/'<cr>]])

-- =============================================================================
-- " Emacs bindings
-- https://www.johndcook.com/blog/emacs_move_cursor/
vim.keymap.set({ 'c', 'i' }, '<C-a>', '<Home>', { desc = 'Beginning line' })
vim.keymap.set({ 'c', 'i' }, '<C-e>', '<End>', { desc = 'End line' })
vim.keymap.set('i', '<C-f>', '<Right>', { desc = 'Next char' })
vim.keymap.set('i', '<C-b>', '<Left>', { desc = 'Previous char' })
vim.keymap.set('i', '<M-f>', '<C-o>w', { desc = 'Next word' })
vim.keymap.set('i', '<M-b>', '<C-o>b', { desc = 'Previous word' })
vim.keymap.set('i', '<C-u>', '<esc>gUiwea', { desc = 'Upcase last word' })
