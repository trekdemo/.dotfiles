local M = {}

M.config = function ()
  local options = { noremap = true, silent = true }
  local map = vim.api.nvim_set_keymap

  map('n', '<localleader>vv', ':Ttoggle<cr>', options)
  map('t', '<localleader>vv', '<c-\\><c-n>:Ttoggle<cr>', options)
end

return M
