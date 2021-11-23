vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use {
    'wbthomason/packer.nvim',
    cmd = { 'PackerCompile', 'PackerSync', 'PackerInstall', 'PackerStatus' }
  }
  use 'lewis6991/impatient.nvim'
  -- use 'nathom/filetype.nvim'
  use 'nvim-lua/plenary.nvim'

  use { -- material.nvim
    'marko-cerovac/material.nvim',
    event = 'VimEnter',
    module = 'material',
    config = function ()
      require('lualine').setup({ options = {theme = 'material-nvim'} })

      local nnoremap = require('utils').nnoremap
      nnoremap('<leader>mt', [[:lua require('material.functions').toggle_style()<CR>]])
      nnoremap('<leader>md', [[:lua require('material.functions').change_style('darker')<CR>]])
      nnoremap('<leader>ml', [[:lua require('material.functions').change_style('lighter')<CR>]])

      require('material').setup({
        contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
        borders = true, -- Enable borders between verticaly split windows

        popup_menu = "light", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

        italics = {
          comments = true, -- Enable italic comments
          keywords = true, -- Enable italic keywords
          functions = false, -- Enable italic functions
          strings = false, -- Enable italic strings
          variables = false -- Enable italic variables
        },

        contrast_windows = { -- Specify which windows get the contrasted (darker) background
          'netrw',
          'help',
          'terminal',
          'packer',
          'qf',
          'OUTLINE',
          'fugitive',
          'gitcommit',
          'ruby.rspec',
        },

        text_contrast = {
          lighter = true, -- Enable higher contrast text for lighter style
          darker = true -- Enable higher contrast text for darker style
        },

        disable = {
          background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false -- Hide the end-of-buffer lines
        },

        custom_highlights = {} -- Overwrite highlights with your own
      })

      vim.g.material_style = "darker"
      vim.cmd [[colorscheme material]]
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function ()
      local util = require('utils')
      util.nnoremap('gb', ':BufferLinePick<CR>')
      util.nnoremap('<leader>bd', ':BufferLinePickClose<CR>')
      util.nnoremap('<leader>bD', ':bdelete<CR>')
      vim.cmd('command! BufOnly silent! execute "%bd|e#|bd#"')
      util.nnoremap('<leader>bo', ':BufOnly<CR>')

      require('bufferline').setup({
        options = {
          max_name_length = 30,
          show_close_icon = false,
          custom_filter = function(buf)
            local ignored_ft = { 'help', 'fugitive', 'term', 'neoterm', 'netrw' }
            if vim.tbl_contains(ignored_ft, vim.bo[buf].filetype) then
              return false
            end

            return true
          end,
        },
      })
    end
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
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = require('geri/config/telescope').config,
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
    config = require('geri/config/nvim-lspconfig').config,
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
        config = require('geri/config/nvim-autopairs').config,
      },
    },
    config = require('geri/config/nvim-cmp').config,
    after = 'lspkind-nvim',
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('geri/config/treesitter').config,
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-textsubjects',
      'romgrk/nvim-treesitter-context',
    }
  }

  use {
    'L3MON4D3/LuaSnip',
    requires = { 'rafamadriz/friendly-snippets' },
    config = require('geri/config/LuaSnip').config,
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
  use { 'vimwiki/vimwiki' }
  use { 'godlygeek/tabular',       ft = { 'markdown' } }
  use { 'ferrine/md-img-paste.vim', ft = { 'markdown' } }
  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.keybinds"] = { -- Configure core.keybinds
            config = {
              default_keybinds = true, -- Generate the default keybinds
              neorg_leader = "<Leader>o" -- This is the default if unspecified
            }
          },
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                notes = "~/neorg"
              }
            }
          },
          ["core.norg.completion"] = {
            config = { engine = "nvim-cmp" }
          },
          ["core.integrations.telescope"] = {},
        },
      }
    end,
    requires = {
      "nvim-lua/plenary.nvim",
       "nvim-neorg/neorg-telescope",
    }
  }

  use 'ncm2/float-preview.nvim' -- Display *preview-window* as a floating window.

  use 'AndrewRadev/splitjoin.vim'

  use 'ggandor/lightspeed.nvim' -- Super-powers for the s, S, f, t operators

  use 'tmux-plugins/vim-tmux' -- Plugin for .tmux.conf ftplugin

  use {
    'alexghergh/nvim-tmux-navigation',
    config = require('geri/config/nvim-tmux-navigation').config,
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
  use {
    'tpope/vim-commentary',
    config = function ()
      local util = require('utils')
      -- TODO: Switch to the gcc (default) mapping
      -- <C-/> is seen by vim as <C-_>
      util.nmap('<C-_>', '<Plug>CommentaryLine')
      util.xmap('<C-_>', '<Plug>Commentary')
      util.omap('<C-_>', '<Plug>Commentary')
    end
  }
  use 'tpope/vim-eunuch'

  use 'justinmk/vim-gtfo'
  use 'tweekmonster/spellrotate.vim'
end)
