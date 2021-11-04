local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
-- Bootstrap when packer is not cloned yet
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use { 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } }
  -- vim.cmd [[
  --   augroup GruvboxCustomizations
  --     autocmd!
  --     " Transparent background
  --     autocmd ColorScheme gruvbox  hi Normal      guibg=NONE ctermbg=NONE
  --                              \ | hi EndOfBuffer guibg=NONE ctermbg=NONE
  --                              \ | hi VertSplit   guibg=NONE ctermbg=NONE
  --   augroup END
  -- ]]
  -- vim.cmd [[colorscheme gruvbox]]
  use {
    'marko-cerovac/material.nvim',
    config = function ()
      local nnoremap = require('utils').nnoremap
      nnoremap('<leader>md', [[:lua require('material.functions').change_style('deep ocean')<CR>]])
      nnoremap('<leader>ml', [[:lua require('material.functions').change_style('lighter')<CR>]])

      require('material').setup({
        contrast = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
        borders = true, -- Enable borders between verticaly split windows

        popup_menu = "light", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

        italics = {
          comments = true, -- Enable italic comments
          keywords = false, -- Enable italic keywords
          functions = true, -- Enable italic functions
          strings = false, -- Enable italic strings
          variables = false -- Enable italic variables
        },

        contrast_windows = { -- Specify which windows get the contrasted (darker) background
          'help',
          "terminal",
          "packer",
          "qf",
          "OUTLINE",
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

      vim.g.material_style = "deep ocean"
      vim.cmd [[colorscheme material]]
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      local util = require('utils')
      util.nnoremap('gb', ':BufferLinePick<CR>')
      util.nnoremap('bd', ':BufferLinePickClose<CR>')
      util.nnoremap('bD', ':bdelete<CR>')

      require('bufferline').setup({
        options = {
          max_name_length = 30,
          show_close_icon = false,
          sort_by = 'tabs',
        },
        -- custom_filter = function(buf, _buf_nums)
        --   return not vim.bo[buf].filetype == "help"
        --   return not vim.bo[buf].filetype == "term"
        --   return true
        -- end,
      })
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("indent_blankline").setup {
        char = "│",
        show_current_context = true,
        buftype_exclude = { "terminal", "help" },
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
    config = require('config/telescope').config,
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'onsails/lspkind-nvim' },
      { 'folke/lua-dev.nvim' },
    },
    config = require('config/nvim-lspconfig').config,
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'f3fora/cmp-spell',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = require('config/nvim-cmp').config,
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('config/treesitter').config,
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      local util = require('utils')
      util.nnoremap('<leader>xx', '<cmd>TroubleToggle<cr>')
      util.nnoremap('<leader>xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>')
      util.nnoremap('<leader>xd', '<cmd>TroubleToggle lsp_document_diagnostics<cr>')
      util.nnoremap('<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
      util.nnoremap('<leader>xl', '<cmd>TroubleToggle loclist<cr>')
      util.nnoremap('gR', '<cmd>TroubleToggle lsp_references<cr>')

      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    'L3MON4D3/LuaSnip',
    requires = {
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'}
    },
    config = require('config/LuaSnip').config,
  }

  use({
    "simrat39/symbols-outline.nvim",
    keys = { "<leader>ls" },
    cmd = { "SymbolsOutline" },
    config = function ()
      local util = require('utils')
      util.nnoremap('<leader>ls', '<cmd>SymbolsOutline<cr>')
    end
  })

  use { 'nvim-lualine/lualine.nvim', config = require('config/lualine-nvim').config }

  use { 'kevinhwang91/nvim-bqf', ft = 'qf' } -- Better quickfix window

  use {
    'roman/golden-ratio',
    cmd = { 'GoldenRatioResize', 'GoldenRatioToggle' },
    config = require('config/golden-ratio').config,
  }

  use {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = { '<leader>z' },
    config = require('config/zen-mode').config,
    requires = {
      {
        'folke/twilight.nvim',
        config = function ()
          require("twilight").setup({ dimming = { alpha = 0.4 } })
        end
      }
    },
  }

  use {
    'kassio/neoterm',
    cmd = { 'Tnew', 'T', 'Texec', 'Topen', 'Ttoggle' },
    config = require('config/neoterm').config,
  }

  use { 'godlygeek/tabular',       ft = { 'markdown' } }
  use { 'fatih/vim-go',            ft = { 'go' } }
  use { 'jgdavey/vim-blockle',     ft = { 'ruby' } }
  use { 'noprompt/vim-yardoc',     ft = { 'ruby' } }
  use { 'tpope/vim-bundler',       ft = { 'ruby' } }
  use { 'tpope/vim-rails',         ft = { 'ruby' } }
  use { 'vim-scripts/bash-support.vim', ft = { 'sh', 'bash' } }
  use 'vimwiki/vimwiki'

  use 'ncm2/float-preview.nvim' -- Display *preview-window* as a floating window.

  use 'AndrewRadev/splitjoin.vim'

  use {
    'windwp/nvim-autopairs',
    config = require('config/nvim-autopairs').config,
    requires = { { 'hrsh7th/nvim-cmp', opt = true } }
  }

  use 'ggandor/lightspeed.nvim' -- Super-powers for the s, S, f, t operators

  use 'tmux-plugins/vim-tmux' -- Plugin for .tmux.conf ftplugin

  use {
    'alexghergh/nvim-tmux-navigation',
    config = require('config/nvim-tmux-navigation').config,
    opt = not vim.env.TMUX,
  }

  use {
    'janko/vim-test',
    requires = {
      { 'benmills/vimux', config = require('config/vimux').config },
      'tpope/vim-dispatch',
      'radenling/vim-dispatch-neovim',
    }
  }

  use {
    'tpope/vim-fugitive',
    requires = { 'tpope/vim-rhubarb' },
    config = require('config/fugitive').config,
  }

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
  use {
    'tpope/vim-surround',
    config = function ()
      -- Wrapping words/selections with (, [, {, ", ', ', ", }, ], )
      local util = require('utils')
      util.nmap('<leader>(', 'viWS(')
      util.vmap('<leader>(', 'S(')
      util.nmap('<leader>)', 'viWS)')
      util.vmap('<leader>)', 'S)')

      util.nmap('<leader>[', 'viWS[')
      util.vmap('<leader>[', 'S[')
      util.nmap('<leader>]', 'viWS]')
      util.vmap('<leader>]', 'S]')

      util.nmap('<leader>{', 'viWS{')
      util.vmap('<leader>{', 'S{')
      util.nmap('<leader>}', 'viWS}')
      util.vmap('<leader>}', 'S}')

      util.nmap('<leader>"', 'viwS"')
      util.vmap('<leader>"', 'S"')
      util.nmap("<leader>'", "viwS'")
      util.vmap("<leader>'", "S'")
    end
  }

  use 'tpope/vim-unimpaired'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-repeat'
  use {
    'tpope/vim-commentary',
    config = function ()
      local util = require('utils')
      -- TODO: Switch to the gcc (default) mapping
      util.nmap('<leader>/', '<Plug>CommentaryLine')
      util.xmap('<leader>/', '<Plug>Commentary')
      util.omap('<leader>/', '<Plug>Commentary')
    end
  }
  use 'tpope/vim-endwise'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-abolish'

  use 'justinmk/vim-gtfo'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
