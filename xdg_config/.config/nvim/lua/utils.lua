_G.puts = function (...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end

local M = {}

function M.prequire(module)
  local ok, err = pcall(require, module)
  if not ok then return nil, err end
  return err
end

return M
