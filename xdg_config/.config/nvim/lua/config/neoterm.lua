local M = {}

local options = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

M.config = function ()
  map('n', '<localleader>vv', ':Ttoggle<cr>', options)
  map('t', '<localleader>vv', '<c-\\><c-n>:Ttoggle<cr>', options)
end

return M
