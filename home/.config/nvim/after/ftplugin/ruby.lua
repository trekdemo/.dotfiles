-- Telescope keymaps are in lua/plugins/telescope.lua

vim.opt_local.iskeyword:append { '?', '!' }
vim.g.ruby_spellcheck_strings = 1

-- Gary Bernhardt's hashrocket
vim.keymap.set('i', '<C-l>', '<Space>=><Space>', { desc = 'Insert =>' })
vim.keymap.set('n', '{', '2{w', { buffer = true, desc = 'Jump to previous block' })
vim.keymap.set('n', '}', '}w', { buffer = true, desc = 'Jump to next block' })

-- See :help b:dispatch
local file = vim.fn.expand '%'
if file:match '_spec.rb$' then
  vim.b['dispatch'] = 'bundle exec rspec %'
else
  vim.b['dispatch'] = 'bundle exec ruby %'
end
