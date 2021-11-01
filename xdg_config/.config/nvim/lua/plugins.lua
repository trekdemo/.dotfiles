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

  use { 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } }
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
    cmd = { "SymbolsOutline" },
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
  use 'godlygeek/tabular'

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
    disable = not vim.env.TMUX,
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
