return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
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
      {
        'ravitemer/mcphub.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
        opts = {},
        cmd = { 'MCPHub' },
      },
    },
    opts = {
      display = {
        chat = {
          -- show_settings = true,
          window = {
            width = 100,
            opts = {
              number = false,
              signcolumn = 'yes:1',
            },
          },
        },
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            show_result_in_chat = true, -- Show mcp tool results in chat
            make_vars = true, -- Convert resources to #variables
            make_slash_commands = true, -- Add prompts as /slash commands
          },
        },
      },
    },
    init = function()
      vim.cmd [[cab cc CodeCompanion]]
    end,
    keys = {
      { '<leader>at', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Toggle CodeCompanion' },
      { '<leader>av', '<cmd>CodeCompanionChat Add<cr>', mode = 'v' },
      { '<leader>aa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' } },
    },
    cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionCmd', 'CodeCompanionActions' },
  },
}
