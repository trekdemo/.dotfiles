local overrides_grp = vim.api.nvim_create_augroup("MyMaterialOverrides", {clear = true})
vim.api.nvim_create_autocmd("ColorScheme", {
  group = overrides_grp,
  pattern = {"material"},
  callback = function()
    vim.cmd [[
    highlight clear LspReferenceText
    highlight clear LspReferenceRead
    highlight clear LspReferenceWrite
    highlight link LspReferenceText Visual
    highlight link LspReferenceRead Visual
    highlight link LspReferenceWrite Visual
    ]]
  end,
})

local mf = require('material.functions')
vim.keymap.set('n', '<leader>mt', mf.find_style, {desc = 'Next material style'})

local g = require('material.colors').git
require('material').setup({
  custom_highlights = {
    -- These highlight groups show up in the fugitive windows
    -- It looks better to have colored text instead of colored background
    diffAdded     = { fg = g.added, reverse = false },
    diffRemoved   = { fg = g.removed, reverse = false },
  },
  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    filetypes = { -- Specify which windows get the contrasted (darker) background
      'netrw',
      'help',
      'terminal',
      'packer',
      'qf',
      'OUTLINE',
      'fugitive',
      'git',
      'gitcommit',
      'gitrebase',
      'Trouble',
      'neotest-summary',
    },
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    strings = { --[[ bold = true ]] },
    keywords = { bold = true },
    functions = { bold = true },
    variables = {},
    operators = {},
    types = {},
  },

  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    -- "dap",
    -- "dashboard",
    "gitsigns",
    -- "hop",
    "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    "nvim-cmp",
    -- "nvim-navic",
    -- "nvim-tree",
    "nvim-web-devicons",
    -- "sneak",
    "telescope",
    -- "trouble",
    "which-key",
  },

  -- disable = {
  --   colored_cursor = false, -- Disable the colored cursor
  --   borders = false, -- Disable borders between verticaly split windows
  --   background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
  --   term_colors = false, -- Prevent the theme from setting terminal colors
  --   eob_lines = false -- Hide the end-of-buffer lines
  -- },

  -- high_visibility = {
  --   lighter = false, -- Enable higher contrast text for lighter style
  --   darker = false -- Enable higher contrast text for darker style
  -- },
})

vim.g.material_style = "darker"
vim.cmd [[colorscheme material]]
