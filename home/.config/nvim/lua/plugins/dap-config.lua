local function setup_dap_ui(dap)
  local ui = require 'dapui'

  dap.listeners.before.attach.dapui_config = ui.open
  dap.listeners.before.launch.dapui_config = ui.open
  dap.listeners.before.event_terminated.dapui_config = ui.close
  dap.listeners.before.event_exited.dapui_config = ui.close
  ui.setup {
    layouts = {
      {
        elements = {
          {
            id = 'scopes',
            size = 0.25,
          },
          {
            id = 'stacks',
            size = 0.5,
          },
          -- {
          --   id = 'watches',
          --   size = 0.25,
          -- },
          {
            id = 'breakpoints',
            size = 0.25,
          },
        },
        position = 'left',
        size = 30,
      },
      {
        elements = {
          {
            id = 'repl',
            size = 0.5,
          },
          {
            id = 'console',
            size = 0.5,
          },
        },
        position = 'bottom',
        size = 10,
      },
    },
  }
end

local function setup_dap_keymaps(dap)
  vim.keymap.set('n', '<space>db', dap.toggle_breakpoint)
  vim.keymap.set('n', '<space>dgb', dap.run_to_cursor)

  -- Eval var under cursor
  vim.keymap.set('n', '<space>?', function()
    require('dapui').eval(nil, { enter = true })
  end)

  vim.keymap.set('n', '<F1>', dap.continue)
  vim.keymap.set('n', '<F2>', dap.step_into)
  vim.keymap.set('n', '<F3>', dap.step_over)
  vim.keymap.set('n', '<F4>', dap.step_out)
  vim.keymap.set('n', '<F5>', dap.step_back)
  vim.keymap.set('n', '<F6>', dap.restart)
end

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'leoluz/nvim-dap-go',
      { 'suketa/nvim-dap-ruby', dir = '~/projects/nvim-dap-ruby/', dev = false },
    },
    config = function()
      local dap = require 'dap'

      require('nvim-dap-virtual-text').setup {}

      require('dap-go').setup()
      require('dap-ruby').setup()

      setup_dap_keymaps(dap)
      setup_dap_ui(dap)
    end,
  },
}
