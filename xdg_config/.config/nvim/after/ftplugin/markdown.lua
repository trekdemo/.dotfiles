vim.g.markdown_fenced_languages = { 'yaml', 'ruby', 'json', 'sh', 'javascript' }

local util = require('utils')
util.nmap('<localleader>p', ":!open -a 'Marked 2' '%'<cr>", { buffer = true, silent = true })

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
