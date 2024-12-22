-- Add indentation guides even on blank lines
return {
  -- See `:help ibl`
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = { char = '│' },
    scope = {
      show_start = false,
      exclude = {
        node_type = { ruby = { 'class', 'module' } },
      },
    },
  },
}
