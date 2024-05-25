local function rdbg_attach_config(name, ...)
  local args = { ... }
  local head = table.remove(args, 1)

  return {
    type = 'ruby',
    request = 'attach',
    localfs = true,
    name = name,
    command = head,
    args = args,
  }
end

return {
  setup = function()
    local dap = require 'dap'
    dap.adapters.ruby = function(callback, config)
      callback {
        type = 'server',
        host = '127.0.0.1',
        port = '${port}',
        executable = {
          command = 'rdbg',
          args = {
            '--nonstop',
            '--open',
            '--port',
            '${port}',
            '--command',
            '--',
            config.command,
            unpack(config.args),
          },
        },
      }
    end

    dap.configurations.ruby = {
      rdbg_attach_config('Debug current file', 'bundle', 'exec', 'ruby', '${file}'),
      rdbg_attach_config('Debug current RSpec file', 'bundle', 'exec', 'rspec', '${file}'),
      rdbg_attach_config('Debug using rails server', 'bundle', 'exec', 'rails', 'server'),
    }
  end,
}
