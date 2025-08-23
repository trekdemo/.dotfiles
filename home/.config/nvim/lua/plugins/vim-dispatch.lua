return {
  'trekdemo/vim-dispatch',
  branch = 'kitty-support',
  -- 'tpope/vim-dispatch',
  -- dev = true,
  -- path = '~/projects/vim-dispatch',
  config = function()
    vim.g.dispatch_compilers = { ['bundle exec'] = '', ['bin/'] = '' }

    vim.keymap.set('n', '<leader>co', ':Copen<CR>') -- Load the output from the last Dispatch
    vim.keymap.set('n', '<leader>cO', ':Copen!<CR>') -- Load the unfiltered output from the last Dispatch

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
