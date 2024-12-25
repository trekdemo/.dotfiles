return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      dependencies = { 'rafamadriz/friendly-snippets' },
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      config = function()
        local ls = require 'luasnip'
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local snippets = {}
        snippets.ruby = {
          s({ trig = 'aa', name = 'attr_accessor' }, {
            t 'attr_accessor :',
            i(1, 'attribute'),
          }),
          s({ trig = 'ar', name = 'attr_reader' }, {
            t 'attr_reader :',
            i(1, 'attribute'),
          }),
          s({ trig = 'aw', name = 'attr_writer' }, {
            t 'attr_writer :',
            i(1, 'attribute'),
          }),
        }
        ls.snippets = snippets

        --  Loads snippets from https://github.com/rafamadriz/friendly-snippets
        -- The plugin is installed using the plugin manager
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    'saadparwaiz1/cmp_luasnip',

    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'f3fora/cmp-spell',
    { 'Gelio/cmp-natdat', opts = true },

    -- Setup Copilot
    -- 'github/copilot.vim',
    -- {
    --   'zbirenbaum/copilot.lua',
    --   cmd = 'Copilot',
    --   event = 'InsertEnter',
    --   opts = {
    --     suggestion = { enabled = false },
    --     panel = { enabled = false },
    --   },
    --   dependencies = {
    --     {
    --       'zbirenbaum/copilot-cmp',
    --       config = function()
    --         require('copilot_cmp').setup()
    --       end,
    --     },
    --   },
    -- },
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      experimental = {
        ghost_text = true, -- this feature conflict with copilot.vim's preview.
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      sources = cmp.config.sources {
        -- { name = 'copilot' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'path' },
        { name = 'natdat' },
      },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-f>'] = cmp.mapping.confirm { select = true },

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
    }
  end,
}
