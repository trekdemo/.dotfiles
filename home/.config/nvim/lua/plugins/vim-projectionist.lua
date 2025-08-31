return {
  {
    'tpope/vim-projectionist',
    lazy = false,
    priority = 99,
    config = function()
      -- Global settings, can be overwritten/extended in .projections.json files
      -- See :help projectionist
      vim.g.projectionist_heuristics = {
        ['*.md'] = { type = 'doc' },
      }
    end,
  },
}
