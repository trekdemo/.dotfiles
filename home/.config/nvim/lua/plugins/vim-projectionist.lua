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
  {
    'rgroli/other.nvim',
    main = 'other-nvim',
    keys = {
      { '<leader>ll', '<cmd>Other<cr>', desc = 'Alternate files' },
    },
    opts = {
      mappings = {
        -- builtin mappings
        'rails',
        'golang',
        'python',
        'react',
        -- Custom mappings
        {
          pattern = '/path/to/file/src/app/(.*)/.*.ext$',
          target = '/path/to/file/src/view/%1/',
          transformer = 'lowercase',
        },
      },
    },
  },
}
