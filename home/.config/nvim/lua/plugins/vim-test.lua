return {
  'vim-test/vim-test',
  dependencies = {
    'benmills/vimux',
    {
      'tpope/vim-dispatch',
      config = function()
        vim.keymap.set('n', "'r", ':Start bundle exec rails console<CR>')
        vim.keymap.set('n', "'m", ':Start rails-mycli<CR>')
        vim.keymap.set('n', "'g", ':Start tig<CR>')
      end,
    },
  },
  config = function()
    vim.g['test#ruby#rspec#options'] = '--format progress'
    vim.g['test#strategy'] = 'dispatch'

    vim.keymap.set('n', '<leader>tl', '<Cmd>TestLast<CR>', { desc = '[T]est [L]ast' })
    vim.keymap.set('n', '<leader>ta', '<Cmd>AbortDispatch<CR>', { desc = '[T]est Dispatch [A]bort' })

    vim.keymap.set('n', '<leader>tn', '<Cmd>TestNearest<CR>', { desc = '[T]est [N]earest' })
    vim.keymap.set('n', '<leader>tf', '<Cmd>TestFile<CR>', { desc = '[T]est [F]ile' })
    vim.keymap.set('n', '<leader>ts', '<Cmd>TestSuite<CR>', { desc = '[T]est [S]uite' })

    local switchStrategy = function(strategy)
      return function()
        vim.g['test#strategy'] = strategy
        print('Using ' .. strategy .. ' to run tests')
      end
    end
    vim.keymap.set('n', '<leader>tv', switchStrategy 'vimux', { desc = 'Use tmux (vimux) to run tests' })
    vim.keymap.set('n', '<leader>td', switchStrategy 'dispatch', { desc = 'Use :Dispatch to run tests' })
    vim.keymap.set('n', '<leader>tD', switchStrategy 'dispatch_background', { desc = 'Use :Dispatch! to run tests' })
  end,
}
