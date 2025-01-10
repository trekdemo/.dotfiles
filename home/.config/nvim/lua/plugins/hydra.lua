return {
  'nvimtools/hydra.nvim',
  config = function()
    require 'plugins.hydra.vim-options'
    require 'plugins.hydra.treewalker'
  end,
}
