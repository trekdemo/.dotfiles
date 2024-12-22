return { -- Vim sugar for the UNIX shell commands that need it the most.
  'tpope/vim-eunuch',
  config = function()
    vim.cmd.cabbrev('rename', 'Rename')
    vim.cmd.cabbrev('dup', 'Duplicate')
    vim.cmd.cabbrev('del', 'Delete')
    vim.cmd.cabbrev('mv', 'Move')
    vim.cmd.cabbrev('mkdir', 'Mkdir!')
    vim.cmd.cabbrev('chmod', 'Chmod')
  end,
}
