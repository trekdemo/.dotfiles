vim.diagnostic.config({
  virtual_text = false,
  signs = true,
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- Diagnostics
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setqflist, { desc = 'Diagnostics - Set quickfix list' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagonstics: Previous' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostics: Next' })
vim.keymap.set('n', '[D', vim.diagnostic.disable, { desc = 'Diagonstics: Disable' })
vim.keymap.set('n', ']D', vim.diagnostic.enable, { desc = 'Diagnostics: Enable' })
