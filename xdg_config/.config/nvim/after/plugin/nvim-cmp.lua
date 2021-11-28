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
    { name = "neorg" },
    { name = 'buffer', keyword_length = 6 },
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

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  },
  experimental = { native_menu = true, },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  completion = {
    -- autocomplete = false,
    keyword_length = 3,
  },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    }),
  experimental = { native_menu = true, },
})

vim.cmd [[
highlight link CmpItemAbbr Normal
highlight link CmpItemAbbrDeprecated Error
highlight link CmpItemAbbrMatchFuzzy MatchParen
highlight link CmpItemKind GruvBoxFg2
highlight link CmpItemMenu Comment
]]
