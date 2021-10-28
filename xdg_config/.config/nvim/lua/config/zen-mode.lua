local M = {}
-- Configuration:
-- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
M.config = function ()
  require("zen-mode").setup {
    window = {
      height = 0.8, -- height of the Zen window
      options = {
        cursorline = false,
        number = false,
      }
    }
  }

  vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<CR>', {expr = false, noremap = true})
end

return M
