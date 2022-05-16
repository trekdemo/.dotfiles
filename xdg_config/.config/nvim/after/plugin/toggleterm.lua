require("toggleterm").setup({
  open_mapping = [[<M-t>]],
  direction = 'float',
  shade_terminals = false,
  float_opts = {
    border = {'▛', '▀','▜', '▐', '▟', '▄', '▙', '▌'},
  },
  on_open = function(term)
    vim.keymap.set('t', "jk", [[<C-\><C-n>]], {buffer = term.bufnr})
  end
})

local Terminal  = require('toggleterm.terminal').Terminal

local gh_dash = Terminal:new({ cmd = "gh dash", hidden = true })
vim.keymap.set("n", "<M-S-h>", function() gh_dash:toggle() end)

local tig = Terminal:new({ cmd = "tig", hidden = true })
vim.keymap.set("n", "<M-S-g>", function() tig:toggle() end)

  -- highlight clear ToggleTermFloatBorder
  -- highlight clear ToggleTermNormalFloat
  -- highlight link ToggleTermFloatBorder FloatBorder
  -- highlight link ToggleTermNormalFloat FloatBorder
