vim.g['test#ruby#rspec#options'] = '--format progress'
vim.g['test#strategy'] = 'dispatch'

vim.keymap.set('n', '<leader>tl', '<Cmd>TestLast<CR>')
vim.keymap.set('n', '<leader>tt', '<Cmd>TestLast<CR>')
vim.keymap.set('n', '<leader>ta', '<Cmd>AbortDispatch<CR>')

vim.keymap.set('n', '<leader>tn', '<Cmd>TestNearest<CR>')
vim.keymap.set('n', '<leader>tf', '<Cmd>TestFile<CR>')
vim.keymap.set('n', '<leader>ts', '<Cmd>TestSuite<CR>')

local switchStrategy = function (strategy)
  return function()
    vim.g['test#strategy'] = strategy
    print("Using " .. strategy .. " to run tests")
  end
end
vim.keymap.set('n', '<leader>tv', switchStrategy('vimux'), { desc = 'Use tmux (vimux) to run tests' })
vim.keymap.set('n', '<leader>td', switchStrategy('dispatch'), { desc = 'Use :Dispatch to run tests' })
