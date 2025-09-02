return {
  'saghen/blink.cmp',
  version = '*', -- Use a release tag to download pre-built binaries
  event = 'InsertEnter',
  dependencies = {
    'rafamadriz/friendly-snippets',
    { 'giuxtaposition/blink-cmp-copilot', dependencies = { 'copilot.lua' } },
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    cmdline = { enabled = false },
    keymap = {
      ['<C-f>'] = { 'select_and_accept', 'fallback' },
    },
    completion = {
      trigger = { show_in_snippet = false },
      ghost_text = { enabled = true },
      menu = {
        auto_show = false,
        border = 'padded',
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } },
        },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      per_filetype = {
        sql = { 'dadbod' },
        codecompanion = { 'codecompanion' },
      },
      providers = {
        snippets = { max_items = 3, min_keyword_length = 1 },
        dadbod = { module = 'vim_dadbod_completion.blink' },
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 100, -- Move copilot completions to the top
          async = true,
        },
        lsp = {
          name = 'LSP',
          module = 'blink.cmp.sources.lsp',
          -- Hide keyword items
          transform_items = function(_, items)
            return vim.tbl_filter(function(item)
              return item.kind ~= require('blink.cmp.types').CompletionItemKind.Keyword
            end, items)
          end,
        },
      },
    },
  },
}
