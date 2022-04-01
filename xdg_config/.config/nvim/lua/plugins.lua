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

  use { -- material.nvim
    'marko-cerovac/material.nvim',
    event = 'VimEnter',
    module = 'material',
    config = function ()
      require('lualine').setup({ options = {theme = 'material-nvim'} })

      require('which-key').register({
        ["<leader>m"] = {
          name = "+material",
          t = { function() require('material.functions').toggle_style() end, "Next style" },
          d = { function() require('material.functions').change_style('darker') end, "Use darker style" },
          l = { function() require('material.functions').change_style('lighter') end, "Use lighter style" },
        }
      })

      require('material').setup({
        contrast = {
          sidebars = true,
          floating_windows = true,
          line_numbers = false,
          sign_column = false,
          cursor_line = false,
          non_current_windows = false,
          popup_menu = false
        }, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree

        italics = {
          comments = true, -- Enable italic comments
          keywords = true, -- Enable italic keywords
          functions = false, -- Enable italic functions
          strings = false, -- Enable italic strings
          variables = false -- Enable italic variables
        },

        contrast_filetypes = { -- Specify which windows get the contrasted (darker) background
          'netrw',
          'help',
          'terminal',
          'packer',
          'qf',
          'OUTLINE',
          'fugitive',
          'gitcommit',
          'gitrebase',
          'ruby.rspec',
        },
      })

      vim.g.material_style = "darker"
      vim.cmd [[colorscheme material]]
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

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
    config = R('geri/config/nvim-lspconfig').config,
  }

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
      {
        'windwp/nvim-autopairs',
        after = 'cmp-path',
        config = R('geri/config/nvim-autopairs').config,
      },
    },
    after = 'lspkind-nvim',
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-textsubjects',
      'romgrk/nvim-treesitter-context',
    }
  }
  use { 'nvim-treesitter/playground', requires = { 'nvim-treesitter/nvim-treesitter' } }

  use {
    'L3MON4D3/LuaSnip',
    requires = { 'rafamadriz/friendly-snippets' },
    config = R('geri/config/LuaSnip').config,
  }

  -- TODO: Install Aerial.nvim
  -- https://github.com/stevearc/aerial.nvim

  use  'nvim-lualine/lualine.nvim'

  use { 'kevinhwang91/nvim-bqf', ft = 'qf' } -- Better quickfix window

  use {
    'roman/golden-ratio',
    cmd = { 'GoldenRatioResize', 'GoldenRatioToggle' },
    keys = { '<C-w>g', '<C-w>G' },
    config = function ()
      vim.g.golden_ratio_exclude_nonmodifiable = 1
      vim.api.nvim_set_keymap('n', '<C-w>g', ':GoldenRatioResize<CR>', {noremap = true});
      vim.api.nvim_set_keymap('n', '<C-w>G', '<C-w>=:GoldenRatioToggle<CR>', {noremap = true});
    end,
  }

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
          options = {
            signcolumn = 'no',
            number = false,
            relativenumber = false,
            cursorline = false,
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
          }
        },
      })

      require'utils'.nnoremap('<leader>z', ':ZenMode<CR>')
    end,
    requires = {
      {
        'folke/twilight.nvim',
        cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
        keys = { '<leader>tl' },
        config = function ()
          require("twilight").setup({ dimming = { alpha = 0.4 } })

          local util = require('utils')
          util.nnoremap('<leader>tl', '<cmd>Twilight<cr>')
        end
      }
    },
  }

  use {
    'kassio/neoterm',
    cmd = { 'T', 'Tnew', 'Texec', 'Topen', 'Tclose', 'Ttoggle' },
  }

  use { 'fatih/vim-go',            ft = { 'go' } }
  use { 'jgdavey/vim-blockle',     ft = { 'ruby' } }
  use { 'noprompt/vim-yardoc',     ft = { 'ruby' } }
  use { 'tpope/vim-bundler',       ft = { 'ruby' } }
  use { 'tpope/vim-rails',         ft = { 'ruby' } }
  use { 'mikepjb/vim-chruby',      ft = { 'ruby' } }
  use { 'vim-scripts/bash-support.vim', ft = { 'sh', 'bash' } }
  use { 'godlygeek/tabular',       ft = { 'markdown' } }

  use 'ncm2/float-preview.nvim' -- Display *preview-window* as a floating window.

  use 'AndrewRadev/splitjoin.vim'

  use 'tmux-plugins/vim-tmux' -- Plugin for .tmux.conf ftplugin

  use {
    'alexghergh/nvim-tmux-navigation',
    config = R('geri/config/nvim-tmux-navigation').config,
    keys = {'<C-h>', '<C-j>', '<C-k>', '<C-l>'},
    opt = not vim.env.TMUX,
  }

  use {
    'janko/vim-test',
    requires = {
      'benmills/vimux' ,
      'tpope/vim-dispatch',
      'radenling/vim-dispatch-neovim',
    }
  }

  use { 'tpope/vim-fugitive', requires = { 'tpope/vim-rhubarb' } }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup({
        signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
        numhl      = true,  -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      })
    end
  }
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'tpope/vim-eunuch'

  use 'justinmk/vim-gtfo'
  use 'tweekmonster/spellrotate.vim'

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require('telescope').load_extension('projects')
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    requires = { 'telescope.nvim' },
  }
end)
