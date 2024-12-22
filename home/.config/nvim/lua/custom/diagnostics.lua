-- Diagnostic
-- `[D` `[d` `]d` `]D`      |MiniBracketed.diagnostic()|
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Diagnostics - Set quickfix list' })
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle Diagnostics' })

vim.diagnostic.config { virtual_text = false }
