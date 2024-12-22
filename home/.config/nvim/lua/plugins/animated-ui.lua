return {
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      require('windows').setup {
        ignore = {
          buftype = { 'quickfix' },
          filetype = { 'Neotest Summary', 'fugitiveblame' },
        },
      }

      vim.keymap.set('n', '<A-Enter>', '<Cmd>WindowsMaximize<CR>')
    end,
  },

  -- Neovide-like cursor animation
  {
    'sphamba/smear-cursor.nvim',
    enabled = not vim.g.neovide,
    opts = {
      -- Faster smear: https://github.com/sphamba/smear-cursor.nvim?tab=readme-ov-file#examples
      stiffness = 0.6,
      trailing_stiffness = 0.4,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
    },
  },
}
