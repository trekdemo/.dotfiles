-- Disable the plugin by default
vim.g.golden_ratio_autocommand = 0

vim.api.nvim_set_keymap('n', '<C-w>g', ':GoldenRatioResize<CR>', {noremap = true});
