local vim = vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  -- use 'nathom/filetype.nvim'
  use 'nvim-lua/plenary.nvim'

  use {
    "folke/which-key.nvim",
    config = function() require("which-key").setup {} end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
        padding = false,
        action_keys = {
          open_split = { "<c-s>" }
        },
      }
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
        {silent = true, noremap = true}
      )
    end
  }

  use 'marko-cerovac/material.nvim'

  use({
    'mrjones2014/dash.nvim',
    run = 'make install',
    config = function ()
      vim.keymap.set('n', '<C-h>', function ()
        local bang = false
        local query = ''
        require('dash').search(bang, query)
      end)
    end
  })

  use { "anuvyklack/windows.nvim",
    requires = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      require('windows').setup({
        ignore = {
          buftype = { "quickfix" },
          filetype = { "Neotest Summary" }
        },
      })

      vim.keymap.set('n', '<A-Enter>', '<Cmd>WindowsMaximize<CR>')
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
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
      'nvim-telescope/telescope-ui-select.nvim',
    },
  }

  use { 'onsails/lspkind-nvim' }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'onsails/lspkind-nvim' },
      { 'folke/neodev.nvim' },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          -- must happen after servers are set up
          require('lsp_signature').setup({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
              border = require('geri.border').thin,
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
    run = [[
      npm install -g cspell
      npm install -g prettier
      brew install shellharden shfmt shellcheck;
      brew install hadolint;
      brew install actionlint
    ]],
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        on_attach = require('geri.config.lsp-on-attach'),
        sources = {
          null_ls.builtins.diagnostics.rubocop, -- gem install rubocop
          null_ls.builtins.hover.dictionary,
          -- null_ls.builtins.diagnostics.cspell.with({
          --   diagnostic_config = {
          --     -- see :help vim.diagnostic.config()
          --     underline = true,
          --     virtual_text = false,
          --     signs = false,
          --     update_in_insert = false,
          --     severity_sort = true,
          --   },
          -- }), -- npm install -g cspell
          null_ls.builtins.diagnostics.actionlint, -- brew install actionlint
          -- shell
          null_ls.builtins.diagnostics.shellcheck,
          null_ls.builtins.formatting.shellharden,
          null_ls.builtins.formatting.shfmt,
          -- dockerfile
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.formatting.prettier,
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
        config = function()
          vim.keymap.set('n', '<leader>tp', '<Cmd>TSPlaygroundToggle<CR>')
        end
      }
    },
    -- Config in after/plugin/treesitter.lua
  }

  -- TODO: For Ruby this is really buggy, it needs work
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      local refac = require('refactoring')
      refac.setup({})
      vim.keymap.set("v", "<leader>rr", refac.select_refactor)
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    requires = { 'rafamadriz/friendly-snippets' },
    config = R('geri/config/LuaSnip').config,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }
  use {
    'arkav/lualine-lsp-progress',
    requires = { 'nvim-lualine/lualine.nvim', opt = true },
  }

  -- use {
  --   'https://gitlab.com/yorickpeterse/nvim-pqf.git',
  --   ft = 'qf',
  --   config = "require('pqf').setup()",
  -- }
  use { 'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('bqf').setup({
        preview = { auto_preview = false },
      })
    end
  } -- Better quickfix window

  use {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = { '<leader>z' },
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 1,
          height = 0.9,
          width = 100,
          options = {
            number = false,
            relativenumber = false,
            cursorline = true,
          }
        },
        plugins = {
          twilight = { enabled = false },
          gitsigns = { enabled = false },
          kitty = {
            enabled = true,
            font = "+1", -- font size increment
          },
        },
      })

      vim.keymap.set('n', '<leader>z', ':ZenMode<CR>')
    end,
    requires = {
      {
        'folke/twilight.nvim',
        -- keys = { '<leader>tl' },
        config = function()
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

  use { 'fatih/vim-go', ft = { 'go' } }
  use { 'jgdavey/vim-blockle', ft = { 'ruby' } }
  use { 'noprompt/vim-yardoc', ft = { 'ruby' } }
  use { 'tpope/vim-bundler', ft = { 'ruby' } }
  use { 'tpope/vim-rails', ft = { 'ruby' } }
  use { 'mikepjb/vim-chruby', ft = { 'ruby' } }
  use { 'vim-scripts/bash-support.vim', ft = { 'sh', 'bash' } }
  use { 'godlygeek/tabular', ft = { 'markdown' } }
  use { 'towolf/vim-helm' }

  use 'AndrewRadev/splitjoin.vim'

  use 'tmux-plugins/vim-tmux' -- Plugin for .tmux.conf ftplugin
  use 'alexghergh/nvim-tmux-navigation'

  use {
    'vim-test/vim-test',
    requires = {
      'benmills/vimux',
      {
        'tpope/vim-dispatch',
        config = function ()
          vim.keymap.set('n', '<M-t>', ':Start zsh<CR>')
          vim.keymap.set('n', '<M-S-r>', ':Start bin/rails console<CR>')
          vim.keymap.set('n', '<M-S-m>', ':Start rails-mycli<CR>')
          vim.keymap.set('n', '<M-S-g>', ':Start tig<CR>')
        end
      },
    }
  }

  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
      'haydenmeade/neotest-jest',
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require('neotest-rspec')({ rspec_cmd = "bin/rspec" }),
          require('neotest-jest'),
        },
        icons = {
          passed = "",
          running = "羽",
          running_animated = { "◐", "◓", "◑", "◒" },
          failed = "",
          skipped = "",
          unknown = "",
        },
        status = {
          enabled = true,
          signs = false,
          virtual_text = true
        },
        floating = {
          max_height = 0.8,
          max_width = 0.9,
          border = require('geri.border').thick
        }
      })

      vim.keymap.set('n', '[t', function () neotest.jump.prev({status = 'failed'}) end, { silent = true })
      vim.keymap.set('n', ']t', function () neotest.jump.next({status = 'failed'}) end, { silent = true })

      vim.keymap.set('n', '<leader>tt', neotest.summary.toggle, { desc = 'Test: Toggle summary' })
      vim.keymap.set('n', '<leader>tl', neotest.run.run_last, { desc = 'Test: Run last' })
      vim.keymap.set('n', '<leader>tx', neotest.run.stop, { desc = 'Test: Stop' })
      vim.keymap.set('n', '<leader>ta', neotest.run.attach, { desc = 'Test: Attach' })
      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open({ enter = false, short = true })
      end, { desc = 'Test: Open output' })

      vim.keymap.set('n', '<leader>tq', function()
        vim.diagnostic.setqflist({ns = 'neotest'})
      end, { desc = 'Test: Populate qfwindow' })

      vim.keymap.set('n', '<leader>tn', neotest.run.run, { desc = 'Test: Nearest' })
      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = 'Test: Current file' })
      vim.keymap.set('n', '<leader>ts', function()
        neotest.run.run(vim.fn.getcwd())
      end, { desc = 'Test: Suite' })
    end
  }

  use { 'tpope/vim-fugitive', requires = { 'tpope/vim-rhubarb' } }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup({
        preview_config = {
          -- Options passed to nvim_open_win
          border = require('geri.border').thin,
        },
        signcolumn = true,
        numhl = true,
      })
      vim.keymap.set('n', '[g', function() gitsigns.prev_hunk({ preview = true }) end, { desc = ":Gitsign next_hunk" })
      vim.keymap.set('n', ']g', function() gitsigns.next_hunk({ preview = true }) end, { desc = ":Gitsign prev_hunk" })
    end,
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-repeat'
  use {
    'tpope/vim-commentary',
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<M-/>', ':Commentary<CR>')
      vim.keymap.set({ 'i' }, '<M-/>', '<Esc>:Commentary<CR>A')
      vim.keymap.set({ 'n', 'v' }, '<C-/>', ':Commentary<CR>')
      vim.keymap.set({ 'i' }, '<C-/>', '<Esc>:Commentary<CR>A')
    end,
  }
  use 'tpope/vim-eunuch'

  use 'tweekmonster/spellrotate.vim'

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({})
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
      require("project_nvim").setup {}
      vim.keymap.set('n', '<leader>fp', ext.projects, { desc = 'Find Projects' })
    end,
    requires = { 'telescope.nvim' },
  }

  use {
    'mbbill/undotree',
    config = function ()
      vim.keymap.set('n', '<leader>u', function() vim.cmd('UndotreeToggle') end)
    end
  }
end)
