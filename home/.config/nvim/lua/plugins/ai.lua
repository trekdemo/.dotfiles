return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = 'copilot',
    windows = {
      ask = {
        floating = true,
        start_insert = false,
      },
      width = 50,
    },
    mappings = {
      files = {
        add_current = '<leader>ab', -- Add current buffer to selected files
      },
    },
  },
  keys = {
    { '<leader>ac', '<cmd>AvanteChat<cr>', desc = 'avante: chat' },
    { '<leader>aC', '<cmd>AvanteClear<cr>', desc = 'avante: clear' },
  },
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = { file_types = { 'markdown', 'Avante' } },
      ft = { 'markdown', 'Avante' },
    },
  },
}
