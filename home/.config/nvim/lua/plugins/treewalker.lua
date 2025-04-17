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
    -- Movement
    vim.keymap.set({ 'n', 'v' }, '<C-k>', '<cmd>Treewalker Up<cr>', { silent = true })
    vim.keymap.set({ 'n', 'v' }, '<C-j>', '<cmd>Treewalker Down<cr>', { silent = true })
    vim.keymap.set({ 'n', 'v' }, '<C-h>', '<cmd>Treewalker Left<cr>', { silent = true })
    vim.keymap.set({ 'n', 'v' }, '<C-l>', '<cmd>Treewalker Right<cr>', { silent = true })

    -- Swapping
    vim.keymap.set('n', '<C-M-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
    vim.keymap.set('n', '<C-M-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
    vim.keymap.set('n', '<C-M-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
    vim.keymap.set('n', '<C-M-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })
  end,
}
