-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  snippet = {
     expand = function(args)
       require('luasnip').lsp_expand(args.body)
     end,
  },
  mapping = {
    ['<C-e>'] = cmp.mapping.scroll_docs(-4),
    ['<C-y>'] = cmp.mapping.scroll_docs(4),
    ['<C-d>'] = cmp.mapping.close(),
    ['<C-f>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'treesitter' },
    { name = 'buffer', keyword_length = 4 },
    { name = 'spell', keyword_length = 4 },
  }),

  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        treesitter = "[tree]",
        path = "[path]",
        spell = "[spell]",
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[lua]",
        luasnip = "[snip]"
      }
    }),
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  }
})

vim.cmd [[
  highlight link CmpItemAbbr Normal
  highlight link CmpItemAbbrDeprecated Error
  highlight link CmpItemAbbrMatchFuzzy MatchParen
  highlight link CmpItemKind GruvBoxFg2
  highlight link CmpItemMenu Comment
]]
