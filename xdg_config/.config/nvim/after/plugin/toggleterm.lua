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

  -- highlight clear ToggleTermFloatBorder
  -- highlight clear ToggleTermNormalFloat
  -- highlight link ToggleTermFloatBorder FloatBorder
  -- highlight link ToggleTermNormalFloat FloatBorder
