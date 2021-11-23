vim.g.markdown_fenced_languages = { 'yaml', 'ruby', 'json', 'sh', 'javascript' }

local util = require('utils')
local cmp = util.prequire("cmp")
if cmp then
  cmp.setup.buffer {
    sources = {
      { name = 'luasnip' },
      { name = 'path' },
    },
  }
end
