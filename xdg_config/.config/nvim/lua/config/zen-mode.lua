local M = {}

-- Configuration:
-- https://github.com/folke/zen-mode.nvim#%EF%B8%8F-configuration
function M.config ()
  require("zen-mode").setup({
    window = {
      width = 100,
      options = {
        signcolumn = 'no',
        number = false,
        relativenumber = false,
        cursorline = false,
        -- cursorcolumn = false, -- disable cursor column
        -- foldcolumn = "0", -- disable fold column
        -- list = false, -- disable whitespace characters
      }
    },
    on_open = function ()
      -- vim.cmd [[hi! Twilight guibg=none ctermbg=none]]
    end,
  })

  require'utils'.nnoremap('<leader>z', ':ZenMode<CR>')
end

return M
