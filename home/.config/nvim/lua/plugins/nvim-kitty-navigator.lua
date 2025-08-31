return {
  'MunsMan/kitty-navigator.nvim',
  cond = (vim.env.TMUX == nil and vim.env.KITTY_PID ~= nil),
  build = {
    'cp navigate_kitty.py ~/.config/kitty',
    'cp pass_keys.py ~/.config/kitty',
  },
  keys = {
    {
      '<M-h>',
      function()
        require('kitty-navigator').navigateLeft()
      end,
      desc = 'Move left a Split',
      mode = { 'n', 't' },
    },
    {
      '<M-j>',
      function()
        require('kitty-navigator').navigateDown()
      end,
      desc = 'Move down a Split',
      mode = { 'n', 't' },
    },
    {
      '<M-k>',
      function()
        require('kitty-navigator').navigateUp()
      end,
      desc = 'Move up a Split',
      mode = { 'n', 't' },
    },
    {
      '<M-l>',
      function()
        require('kitty-navigator').navigateRight()
      end,
      desc = 'Move right a Split',
      mode = { 'n', 't' },
    },
  },
}
