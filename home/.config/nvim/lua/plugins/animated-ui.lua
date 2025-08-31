return {
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
        buftype = { 'quickfix', 'terminal' },
        filetype = { 'Neotest Summary', 'fugitiveblame' },
      },
    }

    vim.keymap.set('n', '<A-Enter>', '<Cmd>WindowsMaximize<CR>', { desc = 'Maximize window' })
  end,
}
