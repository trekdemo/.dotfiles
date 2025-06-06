return {
  'saghen/blink.cmp',
  version = '*', -- Use a release tag to download pre-built binaries
  dependencies = {
    'rafamadriz/friendly-snippets',
    { 'giuxtaposition/blink-cmp-copilot', dependencies = { 'zbirenbaum/copilot.lua' } },
    'Kaiser-Yang/blink-cmp-avante',
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ['<C-space>'] = { 'show', 'hide' },
      ['<C-n>'] = { 'show', 'select_next', 'fallback_to_mappings' },
      ['<C-f>'] = { 'select_and_accept', 'fallback' },
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true },
      menu = {
        auto_show = false,
        border = 'padded',
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } },
        },
      },
    },
    -- Experimental signature help support
    signature = { enabled = false },

    -- Use exact to prioritize snippets when exact matching.
    fuzzy = { sorts = { 'exact', 'score', 'sort_text' } },

    sources = {
      default = { 'buffer', 'snippets', 'copilot', 'lsp', 'path' }, -- with AI
      -- default = { 'buffer', 'snippets', 'lsp', 'path' }, -- without AI
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
        avante = {
          module = 'blink-cmp-avante',
          name = 'Avante',
          opts = {}, -- options for blink-cmp-avante
        },
      },
    },
  },
}
