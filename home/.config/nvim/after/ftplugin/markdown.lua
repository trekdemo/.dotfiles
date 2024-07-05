local cmp = require 'cmp'
cmp.setup.buffer {
  sources = {
    { name = 'luasnip' },
    { name = 'spell', max_item_count = 5 },
    { name = 'buffer' },
    { name = 'natdat' },
  },
}
