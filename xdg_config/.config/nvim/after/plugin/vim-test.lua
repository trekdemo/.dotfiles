vim.g['test#ruby#rspec#options'] = '--format progress'
vim.g['test#strategy'] = 'dispatch'

vim.keymap.set('n', '<leader>tl', '<Cmd>TestLast<CR>')
vim.keymap.set('n', '<leader>ta', '<Cmd>AbortDispatch<CR>')

vim.keymap.set('n', '<leader>tn', '<Cmd>TestNearest<CR>')
vim.keymap.set('n', '<leader>tf', '<Cmd>TestFile<CR>')
vim.keymap.set('n', '<leader>ts', '<Cmd>TestSuite<CR>')
