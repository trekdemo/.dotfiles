local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'treesitter' },
    { name = 'buffer', keyword_length = 6 },
  }),

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
      { name = 'path' },
    })
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
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   },
--   experimental = { native_menu = true, },
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   completion = {
--     -- autocomplete = false,
--     keyword_length = 3,
--   },
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--       { name = 'cmdline' }
--     }),
--   experimental = { native_menu = true, },
-- })

vim.cmd [[
highlight link CmpItemAbbr Normal
highlight link CmpItemAbbrDeprecated Error
highlight link CmpItemAbbrMatchFuzzy MatchParen
highlight link CmpItemKind GruvBoxFg2
highlight link CmpItemMenu Comment
]]
