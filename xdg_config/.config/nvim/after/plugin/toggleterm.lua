-- Custom terminals
local term_on = function(key, config)
  local Terminal = require('toggleterm.terminal').Terminal
  local term = Terminal:new(config)
  local toggle = function() term:toggle() end

  vim.keymap.set({ 'n', 't' }, key, toggle, { desc = 'Open ' .. term.cmd })
end

term_on("<M-S-g>", {
  cmd = "tig",
  dir = "git_dir",
  direction = 'float',
  on_open = function(term)
    vim.cmd("startinsert!")
  end,
})

term_on("<M-S-r>", {
  cmd = "bin/rails console",
  dir = "git_dir",
  direction = 'horizontal',
})

term_on("<M-S-m>", {
  cmd = "rails-mycli",
  dir = "git_dir",
  direction = 'horizontal',
})
