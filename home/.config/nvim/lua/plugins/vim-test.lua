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
        vim.keymap.set('n', "'n", ':Start nnn<CR>')
      end,
    },
  },
  config = function()
    vim.g['test#ruby#rspec#options'] = {
      nearest = '--format documentation --backtrace',
      file = '--format documentation',
      suite = '--format progress',
    }

    vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
    -- vim.g['test#strategy'] = 'dispatch'
    vim.g['test#strategy'] = 'vimux'

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
    vim.keymap.set('n', '<leader>tv', switchStrategy 'vimux', { desc = 'Run [T]ests with [V]imux' })
    vim.keymap.set('n', '<leader>td', switchStrategy 'dispatch', { desc = 'Run [T]ests with [D]ispatch' })
    vim.keymap.set('n', '<leader>tD', switchStrategy 'dispatch_background', { desc = 'Run [T]ests with [D]ispatch!' })
  end,
}
