local specs = {
  {
    'Verf/deepwhite.nvim',
    name = 'color_deepwhite',
    config = function()
      -- Load the colorscheme here
      vim.opt_global.background = 'light'
      vim.cmd.colorscheme 'deepwhite'
    end,
  },
  {
    'cvigilv/patana.nvim',
    name = 'color_patana',
    config = function()
      -- Load the colorscheme here
      vim.opt_global.background = 'light'
      vim.cmd.colorscheme 'patana'
    end,
  },
  {
    'folke/tokyonight.nvim',
    name = 'color_tokyonight',
    config = function()
      vim.cmd.colorscheme 'tokyonight-moon'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
      vim.cmd.hi 'Folded guibg=none'
    end,
  },
}

local name = 'color_tokyonight'
for _, spec in ipairs(specs) do
  if spec.name == name then
    spec.lazy = false -- make sure we load this during startup if it is your main colorscheme
    spec.priority = 1000 -- make sure to load this before all the other start plugins
  else
    spec.lazy = true
  end
end

-- Change the name of the colorscheme plugin below, and then
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
return specs
