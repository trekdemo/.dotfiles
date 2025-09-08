-- Diagnostics configuration
vim.diagnostic.config {
  underline = true,
  float = { scope = 'cursor', border = 'solid' },
}

-- `[D` `[d` `]d` `]D` |MiniBracketed.diagnostic()|
-- `<leader>fd` |telescope.builtin diagnostics()|
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Diagnostics - Set quickfix list' })
