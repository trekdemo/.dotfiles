return {
  'aaronik/treewalker.nvim',

  -- The following options are the defaults.
  -- Treewalker aims for sane defaults, so these are each individually optional,
  -- and setup() does not need to be called, so the whole opts block is optional as well.
  config = function()
    require('treewalker').setup {
      -- Whether to briefly highlight the node after jumping to it
      highlight = false,

      -- How long should above highlight last (in ms)
      highlight_duration = 250,

      -- The color of the above highlight. Must be a valid vim highlight group.
      -- (see :h highlight-group for options)
      highlight_group = 'CursorLine',
    }
  end,
  commands = { 'Treewalker' },
  keys = {
    { '<C-t><C-k>', '<cmd>Treewalker Up<cr>' },
    { '<C-t><C-j>', '<cmd>Treewalker Down<cr>' },
    { '<C-t><C-h>', '<cmd>Treewalker Left<cr>' },
    { '<C-t><C-l>', '<cmd>Treewalker Right<cr>' },
  },
}
