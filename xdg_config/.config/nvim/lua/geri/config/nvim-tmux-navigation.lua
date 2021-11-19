local M = {}

M.config = function()
  local options = { noremap = true, silent = true }
  local map = vim.api.nvim_set_keymap

  require'nvim-tmux-navigation'.setup {
    disable_when_zoomed = false -- Default: false
  }
  map('n', "<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", options)
  map('n', "<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", options)
  map('n', "<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", options)
  map('n', "<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", options)
  -- vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
  map('t', "<C-h>", "<C-\\><C-n><C-h>", { silent = true })
  map('t', "<C-j>", "<C-\\><C-n><C-j>", { silent = true })
  map('t', "<C-k>", "<C-\\><C-n><C-k>", { silent = true })
  -- " I use <C-l> too much to clear the terminal
  -- map('t', "<C-l>", "<C-\\><C-n><C-l>", options)
end

return M
