local M = {}

-- Allows keymaps in lua
-- https://github.com/nanotee/nvim-lua-guide/#vimapinvim_replace_termcodes
M.t = function (str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return M
