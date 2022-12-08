_G.puts = vim.pretty_print
vim.cmd [[cabbrev luap lua vim.pretty_print()<Left>]]

local M = {}

function M.prequire(module)
  local ok, err = pcall(require, module)
  if not ok then return nil, err end
  return err
end

return M
