return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    max_lines = 3,
    -- Line used to calculate context.
    -- Choices: 'cursor', 'topline'
    mode = 'topline',
  },
}
