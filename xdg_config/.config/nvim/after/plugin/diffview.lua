vim.keymap.set('n', '<leader>gd', function()
  local path = vim.api.nvim_buf_get_name(0)
  vim.cmd("DiffviewOpen --selected-file=" .. path)
end, {desc = "DiffviewOpen"})
