local Hydra = require 'hydra'

Hydra {
  name = 'TreeWalker',
  config = {
    color = 'amaranth',
    invoke_on_body = true,
  },
  mode = { 'n', 'x' },
  body = '<leader>tw',
  heads = {
    { 'h', '<cmd>Treewalker Left<cr>', { desc = 'Move left' } },
    { 'j', '<cmd>Treewalker Down<cr>', { desc = 'Move down' } },
    { 'k', '<cmd>Treewalker Up<cr>', { desc = 'Move up' } },
    { 'l', '<cmd>Treewalker Right<cr>', { desc = 'Move right' } },
    { 'H', '<cmd>Treewalker SwapLeft<cr>', { desc = 'Move left' } },
    { 'J', '<cmd>Treewalker SwapDown<cr>', { desc = 'Move down' } },
    { 'K', '<cmd>Treewalker SwapUp<cr>', { desc = 'Move up' } },
    { 'L', '<cmd>Treewalker SwapRight<cr>', { desc = 'Move right' } },
    { 'q', nil, { exit = true } },
    { '<Esc>', nil, { exit = true } },
  },
}
