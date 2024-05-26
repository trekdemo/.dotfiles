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
  'nvim-tree/nvim-web-devicons',
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
  require 'plugins.colorscheme',
  require 'plugins.vim-fugitive',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lsp-config',
  require 'plugins.dap-config',
  require 'plugins.nvim-cmp',
  require 'plugins.nvim-treesitter',
  require 'plugins.mini-nvim',
  require 'plugins.vim-test',
  require 'plugins.windows',
  require 'plugins.ts-node-action',
  require 'plugins.nvim-tmux-navigation',
  require 'plugins.trouble',
  require 'plugins.obsidian',

  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Create annotations with one keybind, and jump your cursor in the inserted
  -- annotationCreate annotations with one keybind, and jump your cursor in the
  -- inserted annotation
  {
    'danymat/neogen',
    config = function()
      local neogen = require 'neogen'
      neogen.setup { snippet_engine = 'luasnip' }
      vim.keymap.set('n', '<leader>ng', neogen.generate, { desc = 'Generate documentation' })
    end,
  },

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
        markdown = { 'mdformat' }, -- pip3 install mdformat-gfm mdformat-frontmatter mdformat-wikilink
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  -- Distraction-free coding for Neovim >= 0.5
  -- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  {
    'folke/zen-mode.nvim',
    dependencies = {
      { 'folke/twilight.nvim', opts = {} },
    },
    config = function()
      require('zen-mode').setup {
        window = {
          backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          width = 100, -- width of the Zen window
          height = 0.8, -- height of the Zen window
        },
        plugins = {
          tmux = { enabled = true }, -- disables the tmux statusline
          kitty = {
            enabled = true,
            font = '+2', -- font size increment
          },
        },
      }

      vim.keymap.set('n', '<leader>z', require('zen-mode').toggle, { desc = '[Z]en Mode' })
    end,
  },

  { -- Add indentation guides even on blank lines
    -- See `:help ibl`
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '│' },
      scope = {
        show_start = false,
        exclude = {
          node_type = { ruby = { 'class', 'module' } },
        },
      },
    },
  },

  { 'kevinhwang91/nvim-bqf', ft = { 'qf' } },
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
  {
    'Vigemus/iron.nvim',
    config = function()
      require 'plugins.repl-config'
    end,
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
