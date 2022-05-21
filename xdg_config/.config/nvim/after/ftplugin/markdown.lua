vim.g.markdown_fenced_languages = { 'yaml', 'ruby', 'json', 'sh', 'javascript' }

local util = require('utils')
local cmp = util.prequire("cmp")
if cmp then
  cmp.setup.buffer {
    sources = {
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
    },
  }
end

vim.keymap.set('n', "<leader>ql", function ()
  local cfile_path = vim.fn.expand("<cfile>")
  local buf_path = vim.fn.expand("%:p")
  local buf_dir = vim.fn.expand("%:p:h")
  local preview_path = ""

  if vim.startswith(cfile_path, "/") then
    preview_path = cfile_path
  elseif vim.startswith(cfile_path, "./") then
    preview_path = vim.fn.substitute(cfile_path, ".", buf_dir, '')
  else
    preview_path = buf_dir .. "/" .. cfile_path
  end

  if vim.fn.filereadable(preview_path) == 0 then
    preview_path = buf_path
  end

  vim.fn.system("qlmanage -p " .. preview_path)
end
, { buffer = true })
