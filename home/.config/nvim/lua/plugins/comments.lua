return {
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Create annotations with one keybind, and jump your cursor in the inserted
  -- annotationCreate annotations with one keybind, and jump your cursor in the
  -- inserted annotation
  {
    'danymat/neogen',
    config = function()
      local neogen = require 'neogen'
      neogen.setup { snippet_engine = 'nvim' }
      vim.keymap.set('n', 'gcg', neogen.generate, { desc = 'Generate documentation' })
    end,
  },
}
