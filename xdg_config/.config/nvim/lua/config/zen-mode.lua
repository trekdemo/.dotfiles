local M = {}

-- Configuration:
-- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
function M.config ()
  require("zen-mode").setup({
    window = {
      height = 0.8, -- height of the Zen window
      width = 100,
      options = {
        signcolumn = 'no',
        cursorline = false,
        number = false,
        relativenumber = false,
      }
    },
    plugin = {
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
      },
      tmux = { enable = true }
    },
    on_open = function ()
      vim.cmd [[hi! Twilight guibg=none ctermbg=none]]
    end,
  })

  require'utils'.nnoremap('<leader>z', ':ZenMode<CR>')
end

return M
