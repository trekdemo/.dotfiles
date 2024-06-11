local deepwhite = {
  'Verf/deepwhite.nvim',
  opts = {},
}

local patana = {
  'cvigilv/patana.nvim',
  config = function()
    -- Load the colorscheme here
    vim.opt_global.background = 'light'
    vim.cmd.colorscheme 'patana'
  end,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

local tokyonight = { -- You can easily change to a different colorscheme.
  'folke/tokyonight.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Load the colorscheme here
    vim.cmd.colorscheme 'tokyonight-moon'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
    vim.cmd.hi 'Folded guibg=none'
  end,
}

-- Change the name of the colorscheme plugin below, and then
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
return ({ deepwhite, patana, tokyonight })[2]
