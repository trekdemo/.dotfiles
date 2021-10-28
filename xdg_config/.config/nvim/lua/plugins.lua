local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
-- Bootstrap when packer is not cloned yet
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
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
    requires = { 'onsails/lspkind-nvim' },
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
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'}
    },
    config = require('config/LuaSnip').config,
  }
  use { 'nvim-lualine/lualine.nvim', config = require('config/lualine-nvim').config }
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' } -- Better quickfix window
  use {
    'roman/golden-ratio',
    cmd = { 'GoldenRatioResize', 'GoldenRatioToggle' },
    config = require('config/golden-ratio').config,
  }
  use { 'folke/zen-mode.nvim', config = require('config/zen-mode').config }
  use 'Shougo/context_filetype.vim'
  use 'fabi1cazenave/termopen.vim'
  use { 'kassio/neoterm', config = require('config/neoterm').config }
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

  use 'kana/vim-smartinput' -- Help with pairs of punctuations such as (), [], {}, '', "" and so on.
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
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-ragtag'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
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
