return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  after = 'catppuccin',
  opts = {
    options = {
      mode = 'buffers', -- set to "tabs" to only show tabpages instead
      show_buffer_icons = false,
    },
  },
}
