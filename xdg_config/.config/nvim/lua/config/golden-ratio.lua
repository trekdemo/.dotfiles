local M = {}

M.config = function ()
  -- Disable the plugin by default
  vim.api.nvim_set_var('golden_ratio_autocommand', 0)
  vim.api.nvim_set_var('g:golden_ratio_exclude_nonmodifiable', '1')

  vim.api.nvim_set_keymap('n', '<C-w>g', ':GoldenRatioResize<CR>', {noremap = true});
  vim.api.nvim_set_keymap('n', '<C-w>G', '<C-w>=:GoldenRatioToggle<CR>', {noremap = true});
end

return M
