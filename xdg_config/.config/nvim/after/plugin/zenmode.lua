-- Configuration:
-- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
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
