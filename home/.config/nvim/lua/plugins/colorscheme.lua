local specs = {
  {
    'Verf/deepwhite.nvim',
    name = 'deepwhite',
    config = function()
      -- Load the colorscheme here
      vim.opt_global.background = 'light'
      vim.cmd.colorscheme 'deepwhite'
    end,
  },
  {
    'cvigilv/patana.nvim',
    name = 'patana',
    config = function()
      -- Load the colorscheme here
      vim.opt_global.background = 'light'
      vim.cmd.colorscheme 'patana'
    end,
  },
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    config = function()
      vim.opt_global.background = 'dark'
      vim.cmd.colorscheme 'tokyonight-moon'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
      vim.cmd.hi 'Folded guibg=none'
    end,
  },
  -- https://github.com/catppuccin/nvim?tab=readme-ov-file#configuration
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      local isDark = vim.fn.system 'osascript -e \'tell application "System Events" to tell appearance preferences to return dark mode\''
      local flavour = 'auto'
      if isDark == 'true\n' then
        flavour = 'macchiato'
      else
        flavour = 'frappe'
      end

      require('catppuccin').setup {
        flavour = flavour, -- latte, frappe, macchiato, mocha
        styles = {
          comments = {}, -- Change the style of comments
        },
        integrations = {
          blink_cmp = true,
          gitsigns = true,
          treesitter = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          mason = true,
          which_key = true,
          dadbod_ui = true,
        },
      }
      vim.opt_global.background = 'dark'
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}

local name = 'catppuccin'
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
