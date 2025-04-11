return {
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   dependencies = {
  --     { 'zbirenbaum/copilot.lua' },
  --     { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
  --   },
  --   build = 'make tiktoken', -- Only on MacOS or Linux
  --   keys = {
  --     { '<leader>at', '<cmd>CopilotChatToggle<cr>', desc = 'Toggle Copilot Chat' },
  --     { '<leader>ap', '<cmd>CopilotChatPrompts<cr>', mode = { 'n', 'v' }, desc = 'CopilotChat Prompts' },
  --   },
  --   opts = {
  --     model = 'claude-3.5-sonnet',
  --     question_header = ' Geri ',
  --     answer_header = ' Copilot ',
  --     auto_insert_mode = false,
  --     window = { width = 0.45 },
  --   },
  -- },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = { file_types = { 'markdown', 'codecompanion' } },
        ft = { 'markdown', 'codecompanion' },
      },
    },
    config = function()
      -- Create an augroup to manage the autocmd
      vim.api.nvim_create_augroup('CodeCompanionSettings', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = 'CodeCompanionSettings',
        pattern = 'codecompanion',
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = 'yes'
          vim.opt_local.cursorline = false
        end,
      })
      vim.cmd [[cab cc CodeCompanion]]
      require('codecompanion').setup {}
    end,
    keys = {
      { '<leader>at', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Toggle CodeCompanion' },
      { '<leader>av', '<cmd>CodeCompanionChat Add<cr>', mode = 'v' },
      { '<leader>aa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' } },
    },
    cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionCmd', 'CodeCompanionActions' },
  },
  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   version = false, -- Never set this value to "*"! Never!
  --   opts = {
  --     provider = 'copilot',
  --     windows = {
  --       ask = {
  --         floating = true,
  --         start_insert = false,
  --       },
  --       width = 50,
  --     },
  --     mappings = {
  --       files = {
  --         add_current = '<leader>ab', -- Add current buffer to selected files
  --       },
  --     },
  --   },
  --   keys = {
  --     { '<leader>ac', '<cmd>AvanteChat<cr>', desc = 'avante: chat' },
  --     { '<leader>aC', '<cmd>AvanteClear<cr>', desc = 'avante: clear' },
  --   },
  --   build = 'make',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = { file_types = { 'markdown', 'Avante' } },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  -- },
}
