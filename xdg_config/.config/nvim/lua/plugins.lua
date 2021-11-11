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

  use { -- Super clean theme, it's a bit too dark for now
    'wuelnerdotexe/vim-enfocado',
    event = 'VimEnter',
    config = function ()
      require('lualine').setup { options = { theme = 'enfocado' } }
      vim.g.enfocado_style = "nature" -- Options: "nature", "neon"
      vim.cmd [[colorscheme enfocado]]
    end
  }

  use {
    'marko-cerovac/material.nvim',
    opt = true,
    config = function ()
      local nnoremap = require('utils').nnoremap
      nnoremap('<leader>mt', [[:lua require('material.functions').toggle_style()<CR>]])
      nnoremap('<leader>md', [[:lua require('material.functions').change_style('palenight')<CR>]])
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
          'help',
          'terminal',
          'packer',
          'qf',
          'OUTLINE',
          'fugitive',
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

      vim.g.material_style = "palenight"
      vim.cmd [[colorscheme material]]
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      local util = require('utils')
      util.nnoremap('gb', ':BufferLinePick<CR>')
      util.nnoremap('<leader>bd', ':BufferLinePickClose<CR>')
      util.nnoremap('<leader>bD', ':bdelete<CR>')

      require('bufferline').setup({
        options = {
          max_name_length = 30,
          show_close_icon = false,
          custom_filter = function(buf)
            local ignored_ft = { 'help', 'fugitive', 'term', 'neoterm' }
            for _, ft in ipairs(ignored_ft) do
              if ft == vim.bo[buf].filetype then
                return false
              end
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
      'RRethy/nvim-treesitter-textsubjects',
      'romgrk/nvim-treesitter-context',
    }
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
    config = function ()
      -- Disable the plugin by default
      vim.api.nvim_set_var('golden_ratio_autocommand', 0)
      vim.api.nvim_set_var('g:golden_ratio_exclude_nonmodifiable', '1')

      vim.api.nvim_set_keymap('n', '<C-w>g', ':GoldenRatioResize<CR>', {noremap = true});
      vim.api.nvim_set_keymap('n', '<C-w>G', '<C-w>=:GoldenRatioToggle<CR>', {noremap = true});
    end,
  }

  use {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    keys = { '<leader>z' },
    config = require('config/zen-mode').config,
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
    after = 'nvim-cmp',
    config = require('config/nvim-autopairs').config,
  }

  use 'ggandor/lightspeed.nvim' -- Super-powers for the s, S, f, t operators

  use 'tmux-plugins/vim-tmux' -- Plugin for .tmux.conf ftplugin

  use {
    'alexghergh/nvim-tmux-navigation',
    config = require('config/nvim-tmux-navigation').config,
    keys = {'<C-h>', '<C-j>', '<C-k>', '<C-l>'},
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
      -- <C-/> is seen by vim as <C-_>
      util.nmap('<C-_>', '<Plug>CommentaryLine')
      util.xmap('<C-_>', '<Plug>Commentary')
      util.omap('<C-_>', '<Plug>Commentary')
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
