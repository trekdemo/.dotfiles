-- Diagnostics configuration
local diagnostics_virtual_text = false
vim.diagnostic.config { virtual_text = diagnostics_virtual_text }

-- `[D` `[d` `]d` `]D` |MiniBracketed.diagnostic()|
-- `<leader>fd` |telescope.builtin diagnostics()|
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { desc = 'Diagnostics - Set quickfix list' })
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle Diagnostics' })

-- Toggle diagnostics virtual text in insert mode
-- Display diagnostics as virtual text only if not in insert mode
if diagnostics_virtual_text then
  local function toggle_diagnostics_virtual_text()
    vim.diagnostic.config { virtual_text = not (vim.fn.mode() == 'i') }
  end

  local group_augrp = vim.api.nvim_create_augroup('group-autocmds', { clear = true })
  vim.api.nvim_create_autocmd('InsertEnter', {
    group = group_augrp,
    pattern = '*',
    callback = toggle_diagnostics_virtual_text,
  })
  vim.api.nvim_create_autocmd('InsertLeave', {
    group = group_augrp,
    pattern = '*',
    callback = toggle_diagnostics_virtual_text,
  })
end
