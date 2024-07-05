-- Diagnostic
-- `[D` `[d` `]d` `]D`      |MiniBracketed.diagnostic()|
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Diagnostics - Set quickfix list' })

vim.diagnostic.config { virtual_text = false }
