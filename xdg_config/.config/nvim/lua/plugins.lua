vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  -- use 'nathom/filetype.nvim'
  use 'nvim-lua/plenary.nvim'

  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup{} end
  }

  use { 'marko-cerovac/material.nvim', opt = true }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("indent_blankline").setup {
        use_treesitter = true,
        char = "│",
        show_current_context = true,
        filetype_exclude = { "help" },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        max_indent_increase = 1,
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'kyazdani42/nvim-web-devicons',
      'jeetsukumaran/telescope-rtp',
      'nvim-telescope/telescope-symbols.nvim',
      'folke/which-key.nvim',
    },
  }

  use { 'onsails/lspkind-nvim' }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'onsails/lspkind-nvim' },
      { 'folke/lua-dev.nvim' },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          -- must happen after servers are set up
          require('lsp_signature').setup({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
              border = 'rounded',
            },
          })
        end,
        after = 'nvim-lspconfig',
      },
    },
    config = function() R('geri/config/nvim-lspconfig')() end,
  }

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function ()
      local null_ls = require("null-ls")
      null_ls.setup({
        on_attach = require('geri.config.lsp-on-attach'),
        sources = {
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.hover.dictionary,
          null_ls.builtins.diagnostics.write_good,
          null_ls.builtins.code_actions.gitsigns,
        },
      })
    end,
  })

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer', after = 'cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua', after = 'cmp-buffer' },
      { 'hrsh7th/cmp-path', after = 'cmp-nvim-lua' },
      { 'ray-x/cmp-treesitter', after = 'cmp-path' },
      { 'hrsh7th/cmp-cmdline', after = 'cmp-treesitter' },
      { "petertriho/cmp-git",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("cmp_git").setup() end,
      },
      {
        'windwp/nvim-autopairs',
        after = 'cmp-path',
        config = R('geri/config/nvim-autopairs').config,
      },
    },
    after = 'lspkind-nvim',
  }

  -- --------------------------------------------------------------------------
  -- --[ Treesitter ]----------------------------------------------------------
  -- --------------------------------------------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-textsubjects',
      {
        'nvim-treesitter/playground',
        config = function ()
          vim.keymap.set('n', '<leader>tp', '<Cmd>TSPlaygroundToggle<CR>')
        end
      }
    },
    -- Config in after/plugin/treesitter.lua
  }

  use {
    'drybalka/tree-climber.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function ()
      local tc = require('tree-climber')
      local around = function (movement) return movement end

      vim.keymap.set({'n', 'v'}, '<S-Left>', around(tc.goto_parent), {desc = 'Goto parent'})
      vim.keymap.set({'n', 'v'}, '<S-Right>', around(tc.goto_child), {desc = 'Goto child'})
      vim.keymap.set({'n', 'v'}, '<S-Down>', around(tc.goto_next), {desc = 'Goto next'})
      vim.keymap.set({'n', 'v'}, '<S-Up>', around(tc.goto_prev), {desc = ''})
      vim.keymap.set('n', '<A-S-Down>', tc.swap_next, {desc = ''})
      vim.keymap.set('n', '<A-S-Up>',   tc.swap_prev, {desc = ''})
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    requires = { 'rafamadriz/friendly-snippets' },
    config = R('geri/config/LuaSnip').config,
  }

  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use {
    'arkav/lualine-lsp-progress',
    requires = { 'nvim-lualine/lualine.nvim', opt = true },
  }

  use {
    'https://gitlab.com/yorickpeterse/nvim-pqf.git',
    ft = 'qf',
    config = "require('pqf').setup()",
  }
  use { 'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function ()
      require('bqf').setup({
        preview = { auto_preview = false },
      })
    end
  } -- Better quickfix window

  use {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = { '<leader>z' },
    config = function ()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          height = 0.9,
          width = 100,
        },
        plugins = {
          twilight = { enabled = false },
          gitsigns = { enabled = true },
        },
      })

      vim.keymap.set('n', '<leader>z', ':ZenMode<CR>')
    end,
    requires = {
      {
        'folke/twilight.nvim',
        -- keys = { '<leader>tl' },
        config = function ()
          local tw = require("twilight")

          -- FIXME: This is shadowed by TestLast
          -- vim.keymap.set('n', '<leader>tl', tw.toggle, {desc = 'Toggle Twilight'})

          tw.setup({
            dimming = { alpha = 0.4 },
            expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
              "function",
              "method",
              "table",
            },
          })
        end
      }
    },
  }

  use { "akinsho/toggleterm.nvim", tag = 'v1.*' }

  use { 'fatih/vim-go',            ft = { 'go' } }
  use { 'jgdavey/vim-blockle',     ft = { 'ruby' } }
  use { 'noprompt/vim-yardoc',     ft = { 'ruby' } }
  use { 'tpope/vim-bundler',       ft = { 'ruby' } }
  use { 'tpope/vim-rails',         ft = { 'ruby' } }
  use { 'mikepjb/vim-chruby',      ft = { 'ruby' } }
  use { 'vim-scripts/bash-support.vim', ft = { 'sh', 'bash' } }
  use { 'godlygeek/tabular',       ft = { 'markdown' } }
  use { 'towolf/vim-helm' }

  use 'ncm2/float-preview.nvim' -- Display *preview-window* as a floating window.

  use 'AndrewRadev/splitjoin.vim'

  use 'tmux-plugins/vim-tmux' -- Plugin for .tmux.conf ftplugin

  use {
    'alexghergh/nvim-tmux-navigation',
    config = R('geri/config/nvim-tmux-navigation').config,
    keys = {'<A-h>',    '<A-j>',    '<A-k>',  '<A-l>',
            '<A-Left>', '<A-Down>', '<A-Up>', '<A-Right>'},
  }

  use {
    'vim-test/vim-test',
    requires = {
      'benmills/vimux' ,
      'tpope/vim-dispatch',
    }
  }

  use { 'tpope/vim-fugitive', requires = { 'tpope/vim-rhubarb' } }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end,
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-repeat'
  use {
    'tpope/vim-commentary',
    config = function ()
      vim.keymap.set({'n', 'v'}, '<M-/>', ':Commentary<CR>')
      vim.keymap.set({'i'}, '<M-/>', '<Esc>:Commentary<CR>A')
    end,
  }
  use 'tpope/vim-eunuch'

  use 'tweekmonster/spellrotate.vim'
  use {
    'lewis6991/spellsitter.nvim',
    config = function() require('spellsitter').setup() end,
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup { }
      vim.keymap.set('n', '<leader>ft', ':TodoTelescope<CR>')
    end
  }

  -- use {
  --   'suketa/nvim-dap-ruby',
  --   requires = 'mfussenegger/nvim-dap',
  --   config = function ()
  --     require('dap-ruby').setup()
  --   end
  -- }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      local ext = require('telescope').load_extension('projects')
      require("project_nvim").setup{}
      vim.keymap.set('n', '<leader>fp', ext.projects, {desc = 'Find Projects'})
    end,
    requires = { 'telescope.nvim' },
  }
end)
