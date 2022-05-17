require("toggleterm").setup({
  open_mapping = [[<M-t>]],
  direction = 'float',
  float_opts = {
    border = {'▛', '▀','▜', '▐', '▟', '▄', '▙', '▌'},
  },
})

vim.cmd [[tnoremap <A-[> <c-\><c-n>]]

local Terminal  = require('toggleterm.terminal').Terminal

local gh_dash = Terminal:new({ cmd = "gh dash", hidden = true })
vim.keymap.set({'n', 't'}, "<M-S-h>", function() gh_dash:toggle() end)

local tig = Terminal:new({ cmd = "tig", hidden = true })
vim.keymap.set({'n', 't'}, "<M-S-g>", function() tig:toggle() end)

local rails_c = Terminal:new({
  cmd = "bin/rails console",
  dir = "git_dir",
  direction = 'horizontal',
  hidden = true,
  close_on_exit = false,
})
vim.keymap.set({'n', 't'}, "<M-S-r>", function() rails_c:toggle() end)
