local M = {}

M.config = function ()
  -- Usage and customization
  -- https://github.com/nvim-lualine/lualine.nvim#usage-and-customization
  require('lualine').setup({
    -- options = {theme = 'gruvbox_dark'},
    options = {theme = 'material-nvim'},
  })
end

return M
