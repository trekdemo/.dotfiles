vim.o.guifont = 'VictorMono Nerd Font:h15'
-- vim.o.guifont = "JetBrainsMono Nerd Font:h14"

-- Put anything you want to happen only in Neovide here
if vim.g.neovide then
  -- Set the background option when Neovide starts. Possible values: light,
  -- dark, auto. On systems that support it, auto will mirror the system theme,
  -- and will update background when the system theme changes.
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_hide_mouse_when_typing = true
  -- vim.g.neovide_input_use_logo = true

  -- Interprets Alt + whatever actually as <M-whatever>, instead of sending the
  -- actual special character to Neovim.
  vim.g.neovide_input_macos_alt_is_meta = true

  -- https://neovide.dev/configuration.html#cursor-particles
  vim.g.neovide_cursor_animation_length = 0.04
  vim.g.neovide_cursor_trail_size = 0.45
  vim.g.neovide_cursor_vfx_mode = 'pixiedust'
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 20.0

  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<C-o>"+P') -- Paste insert mode
end
