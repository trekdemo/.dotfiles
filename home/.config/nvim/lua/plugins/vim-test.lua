return {
  'vim-test/vim-test',
  dependencies = { 'vim-dispatch' },
  config = function()
    vim.g['test#strategy'] = 'dispatch'

    vim.keymap.set('n', '<leader>tl', '<Cmd>TestLast<CR>', { desc = '[T]est [L]ast' })
    vim.keymap.set('n', '<leader>ta', '<Cmd>AbortDispatch<CR>', { desc = '[T]est Dispatch [A]bort' })

    vim.keymap.set('n', '<leader>tn', '<Cmd>TestNearest<CR>', { desc = '[T]est [N]earest' })
    vim.keymap.set('n', '<leader>tf', '<Cmd>TestFile<CR>', { desc = '[T]est [F]ile' })
    vim.keymap.set('n', '<leader>ts', '<Cmd>TestSuite<CR>', { desc = '[T]est [S]uite' })

    local switchStrategy = function(strategy)
      return function()
        vim.g['test#strategy'] = strategy
        vim.notify('Using ' .. strategy .. ' to run tests', vim.log.levels.INFO)
      end
    end
    vim.keymap.set('n', '<leader>tk', switchStrategy 'kitty', { desc = 'Run [T]ests with Kitty' })
    vim.keymap.set('n', '<leader>td', switchStrategy 'dispatch', { desc = 'Run [T]ests with [D]ispatch' })

    -- [LANGUAGE SPECIFIC SETTINGS] -------------------------------------------
    -- Ruby settings for RSpec
    vim.g['test#ruby#rspec#executable'] = 'bin/rspec'
    vim.g['test#ruby#rspec#options'] = {
      nearest = '--format documentation',
      file = '--format documentation',
      suite = '--format progress',
    }
  end,
}
