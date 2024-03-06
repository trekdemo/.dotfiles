-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'custom.options'
require 'custom.keymaps'
require 'custom.autocommands'
require 'custom.gui'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-vinegar', -- Expends netrw to become even more powerful.
  { -- Vim sugar for the UNIX shell commands that need it the most.
    'tpope/vim-eunuch',
    config = function()
      vim.cmd.cabbrev('rename', 'Rename')
      vim.cmd.cabbrev('del', 'Delete')
      vim.cmd.cabbrev('move', 'Move')
      vim.cmd.cabbrev('mkdir', 'Mkdir!')
    end,
  },
  require 'plugins.vim-fugitive',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lsp-config',
  require 'plugins.nvim-cmp',
  require 'plugins.nvim-treesitter',
  require 'plugins.mini-nvim',
  require 'plugins.vim-test',
  require 'plugins.windows',
  require 'plugins.ts-node-action',
  require 'plugins.nvim-tmux-navigation',

  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      numhl = true,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  -- 'marko-cerovac/material.nvim',

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Add indentation guides even on blank lines
    -- See `:help ibl`
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '│' },
      scope = {
        exclude = {
          node_type = { ruby = { 'class', 'module' } },
        },
      },
    },
  },

  { 'fatih/vim-go', ft = { 'go' } },
  { 'jgdavey/vim-blockle', ft = { 'ruby' } },
  { 'noprompt/vim-yardoc', ft = { 'ruby' } },
  { 'tpope/vim-bundler', ft = { 'ruby' } },
  { 'tpope/vim-rails', ft = { 'ruby' } },
  { 'rbong/vim-flog', ft = { 'ruby' } },
  { 'mikepjb/vim-chruby', ft = { 'ruby' } },
  { 'tpope/vim-ragtag', ft = { 'eruby', 'html', 'xml', 'javascript.jsx', 'jsx', 'typescript.tsx', 'tsx' } },
  { 'vim-scripts/bash-support.vim', ft = { 'sh', 'bash' } },
  { 'mracos/mermaid.vim', ft = { 'markdown', 'mermaid' } },
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  { 'towolf/vim-helm', ft = { 'helm' } },
  { 'tmux-plugins/vim-tmux', ft = { 'tmux' } },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
