return {
  'vim-test/vim-test',
  dependencies = {
    'benmills/vimux',
    {
      'tpope/vim-dispatch',
      config = function()
        -- This needs to be set to 1, to be able to use REPL-based debugging
        -- Also, when the output is messy use :Copen! command to load the
        -- unformmatted test output
        vim.g['dispatch_tmux_pipe_pane'] = 0
        local set_editor_to_current_instance = 'EDITOR="nvr --servername ' .. vim.v['servername']
        vim.keymap.set('n', "'r", ':Start bundle exec rails console<CR>')
        vim.keymap.set('n', "'m", ':Start rails-mycli<CR>')
        vim.keymap.set('n', "'n", ':Start ' .. set_editor_to_current_instance .. ' yazi<CR>')
        vim.keymap.set('n', "'d", ':Start ' .. set_editor_to_current_instance .. ' lazydocker<CR>')
        vim.keymap.set('n', "'g", ':Start ' .. set_editor_to_current_instance .. ' lazygit<CR>')
      end,
    },
  },
  config = function()
    if vim.g.neovide then
      vim.g['test#neovim_sticky#reopen_window'] = 1
      vim.g['test#strategy'] = 'neovim_sticky'
    else
      -- vim.g['test#strategy'] = 'vimux'
      vim.g['test#strategy'] = 'dispatch'
    end

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
    vim.keymap.set('n', '<leader>tv', switchStrategy 'vimux', { desc = 'Run [T]ests with [V]imux' })
    vim.keymap.set('n', '<leader>tS', switchStrategy 'neovim_sticky', { desc = 'Run [T]ests with Neovim [S]ticky' })
    vim.keymap.set('n', '<leader>td', switchStrategy 'dispatch', { desc = 'Run [T]ests with [D]ispatch' })
    vim.keymap.set('n', '<leader>tD', switchStrategy 'dispatch_background', { desc = 'Run [T]ests with [D]ispatch!' })

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
