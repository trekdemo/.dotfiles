vim.o.guifont = 'VictorMono Nerd Font:h15'
-- vim.o.guifont = "JetBrainsMono Nerd Font:h14"

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_input_use_logo = true
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_cursor_animation_length = 0.02
  vim.g.neovide_cursor_trail_size = 0.25
  vim.g.neovide_cursor_vfx_mode = ''
  -- vim.g.novide_cursor_vfx_mode = "pixiedust"

  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end
