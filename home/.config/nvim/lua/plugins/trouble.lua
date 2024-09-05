return {
  'folke/trouble.nvim',
  -- branch = 'dev', -- IMPORTANT! https://github.com/folke/trouble.nvim/tree/dev
  keys = {
    {
      '<leader>xx',
      '<cmd>TroubleToggle document_diagnostics<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>TroubleToggle workspace_diagnostics<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xt',
      '<cmd>TroubleToggle todo<cr>',
      desc = 'Project TODOs (Trouble)',
    },
  },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
}
