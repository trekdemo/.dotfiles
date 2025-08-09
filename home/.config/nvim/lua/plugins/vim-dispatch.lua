return {
  'tpope/vim-dispatch',
  config = function()
    vim.keymap.set('n', '<leader>cO', ':Copen!<CR>') -- Load the unfiltered output from the last Dispatch

    -- This needs to be set to 1, to be able to use REPL-based debugging
    -- Also, when the output is messy use :Copen! command to load the
    -- unformatted test output
    vim.g['dispatch_tmux_pipe_pane'] = 0

    local map_start_cmd = function(mapping, command)
      vim.keymap.set('n', mapping, ':Start ' .. command .. '<CR>')
    end

    map_start_cmd("'c", 'bin/dcr')
    map_start_cmd("'d", 'lazydocker')
    map_start_cmd("'g", 'lazygit')
    map_start_cmd("'m", 'rails-mycli')
    map_start_cmd("'n", 'yazi')
    map_start_cmd("'r", 'bin/rails console')
  end,
}
