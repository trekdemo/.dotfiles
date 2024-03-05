-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local custom_autocmds = vim.api.nvim_create_augroup('custom-autocmds', { clear = true })

vim.api.nvim_create_autocmd({ 'VimResized' }, {
  desc = 'Egalize windows',
  group = custom_autocmds,
  callback = function()
    vim.cmd 'wincmd ='
  end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  desc = 'Display cursor line',
  group = custom_autocmds,
  callback = function()
    vim.opt.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
  desc = 'Hide cursor line',
  group = custom_autocmds,
  callback = function()
    vim.opt.cursorline = false
  end,
})
