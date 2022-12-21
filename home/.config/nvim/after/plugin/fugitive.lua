local vim = vim
vim.cmd.cabbrev('g', 'Git')

vim.keymap.set('n', '<leader>g<Space>', ':Git<Space>')
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gg', vim.cmd.Git)
vim.keymap.set('n', '<leader>gw', vim.cmd.Gwrite)
vim.keymap.set('n', '<leader>ga', vim.cmd.Gadd)
vim.keymap.set('n', '<leader>gb', function() vim.cmd.Git('blame') end)
vim.keymap.set('n', '<leader>gl', function() vim.cmd.Git('log') end)
vim.keymap.set('n', '<leader>gP', ':!gh pr view -w || gh pr create -w<cr>')
