local Hydra = require 'hydra'

Hydra {
  name = 'AIder',
  config = {
    color = 'blue',
    invoke_on_body = true,
  },
  mode = { 'n', 'x' },
  body = '<leader>ai',
  heads = {
    {
      'a',
      "<cmd>call VimuxRunCommand('/add ' .. expand('%:p'))<cr>",
      { desc = 'Add current file to context' },
    },
    { 'q', nil, { exit = true } },
  },
}
