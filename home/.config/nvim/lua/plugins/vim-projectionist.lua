return {
  'tpope/vim-projectionist',
  opts = {},
  config = function()
    -- Global settings, can be overwritten/extended in .projections.json files
    -- See :help projectionist
    vim.g.projectionist_heuristics = {
      ['*.md'] = { type = 'doc' },
    }
  end,
}
