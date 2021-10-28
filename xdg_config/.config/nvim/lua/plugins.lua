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

  use { 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim', opt = true } }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'kyazdani42/nvim-web-devicons'
    },
  }
  use {
    'neovim/nvim-lspconfig',
    requires = { 'onsails/lspkind-nvim' },
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
    }
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'}
    },
  }
  use 'nvim-lualine/lualine.nvim'
  use 'kevinhwang91/nvim-bqf'
  use { 'roman/golden-ratio', opt = true, cmd = { 'GoldenRatioResize', 'GoldenRatioToggle' } }
  use 'folke/zen-mode.nvim'
  use 'Shougo/context_filetype.vim'
  use 'junegunn/gv.vim' -- Simple git log viewer - <leader>gl
  use 'fabi1cazenave/termopen.vim'
  use 'kassio/neoterm'
  use 'godlygeek/tabular'

  use { 'fatih/vim-go',            ft = { 'go' } }
  use { 'jgdavey/vim-blockle',     ft = { 'ruby' } }
  use { 'noprompt/vim-yardoc',     ft = { 'ruby' } }
  use { 'tpope/vim-bundler',       ft = { 'ruby' } }
  use { 'tpope/vim-rails',         ft = { 'ruby' } }
  use 'vim-scripts/bash-support.vim'
  use 'vimwiki/vimwiki'

  use 'ncm2/float-preview.nvim' -- Display *preview-window* as a floating window.

  use 'AndrewRadev/splitjoin.vim'
  use 'kana/vim-smartinput' -- Help with pairs of punctuations such as (), [], {}, '', "" and so on.
  use 'ggandor/lightspeed.nvim' -- Super-powers for the s, S, f, t operators

  if vim.env.TMUX then
    use 'christoomey/vim-tmux-navigator'
    use 'tmux-plugins/vim-tmux'
  end

  -- " Running tests
  use {
    'janko/vim-test',
    requires = {
      'benmills/vimux',
      'tpope/vim-dispatch',
      'radenling/vim-dispatch-neovim',
    }
  }
  use { 'tpope/vim-fugitive', requires = { 'tpope/vim-rhubarb' } }
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
