return {
  'anuvyklack/windows.nvim',
  dependencies = {
    'anuvyklack/middleclass',
    'anuvyklack/animation.nvim',
  },
  keys = {
    { '<C-w>z', '<Cmd>WindowsMaximize<CR>' },
    { '<C-w>=', '<Cmd>WindowsEqualize<CR>' },
  },
  commands = { 'WindowsMaximize, WindowsEqualize' },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10

    require('windows').setup {
      ignore = {
        buftype = { 'quickfix', 'terminal' },
        filetype = { 'Neotest Summary', 'fugitiveblame' },
      },
    }
  end,
}
