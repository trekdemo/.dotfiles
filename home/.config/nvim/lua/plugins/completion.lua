return {
  'saghen/blink.cmp',
  dependencies = {
    {
      'zbirenbaum/copilot.lua',
      config = function()
        require('copilot').setup {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      end,
    },
    'rafamadriz/friendly-snippets',
    'giuxtaposition/blink-cmp-copilot',
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
      -- Show documentation when selecting a completion item
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
    -- Use exact to prioritize snippets when exact matching.
    fuzzy = { sorts = { 'exact', 'score', 'sort_text' } },

    sources = {
      default = { 'snippets', 'copilot', 'lsp', 'path', 'buffer' },
      providers = {
        snippets = { max_items = 3, min_keyword_length = 1 },
        buffer = { max_items = 5, min_keyword_length = 3 },
        copilot = {
          name = 'copilot',
          module = 'blink-cmp-copilot',
          score_offset = 100, -- Move copilot completions to the top
          async = true,
        },
      },
    },

    -- Experimental signature help support
    signature = { enabled = true },
  },

  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',
}
