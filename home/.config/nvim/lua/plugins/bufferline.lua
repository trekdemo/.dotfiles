return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = 'buffers', -- set to "tabs" to only show tabpages instead
      show_buffer_icons = false,
    },
  },
}
