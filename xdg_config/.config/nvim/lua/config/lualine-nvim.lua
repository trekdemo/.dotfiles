local M = {}

M.config = function ()
  -- Usage and customization
  -- https://github.com/nvim-lualine/lualine.nvim#usage-and-customization
  require('lualine').setup({
    options = {theme = 'gruvbox_dark'},
  })
end

return M
