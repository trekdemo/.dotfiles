return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = { numhl = true },
  },

  {
    'sindrets/diffview.nvim',
    opts = {},
    keys = {
      { '<leader>gvo', '<cmd>DiffviewOpen<cr>', desc = '[diffview]: Open' },
      { '<leader>gvc', '<cmd>DiffviewClose<cr>', desc = '[diffview]: Close' },
    },
  },

  -- A Git wrapper so awesome, it should be illegal
  {
    'tpope/vim-fugitive',
    dependencies = { 'tpope/vim-rhubarb' },
    config = function()
      local vim = vim
      vim.keymap.set('n', '<leader>g<Space>', ':Git<Space>')
      vim.keymap.set('n', '<leader>gs', ':Git<cr>')
      vim.keymap.set('n', '<leader>gw', ':Gwrite<cr>')
      vim.keymap.set('n', '<leader>ga', ':Gadd<cr>')
      vim.keymap.set('n', '<leader>gb', ':Git blame<CR>')
      vim.keymap.set('n', '<leader>gl', ':Git bl<CR>')
      vim.keymap.set('n', '<leader>ghp', ':!gh pr view -w || gh pr create -w<cr>', { desc = 'Create or view GitHub PR' })
    end,
  },
}
