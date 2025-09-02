local function config_vim_rails()
  vim.keymap.set('n', '<leader>ri', ':Eschema<space>', { desc = 'Edit Rails schema' })
  vim.keymap.set('n', '<leader>rI', ':Vschema<space>', { desc = 'Edit Rails schema' })
end

return {
  { 'noprompt/vim-yardoc', ft = { 'ruby' } },
  { 'tpope/vim-bundler', ft = { 'ruby' } },
  { 'vim-ruby/vim-ruby', ft = { 'ruby' }, lazy = false },
  -- See the Rails-related Telescope finders in telescope.lua
  { 'tpope/vim-rails', ft = { 'ruby' }, config = config_vim_rails, lazy = false },
  { 'rbong/vim-flog', ft = { 'ruby' } },
  { 'tpope/vim-ragtag', ft = { 'eruby', 'html', 'xml', 'javascript.jsx', 'jsx', 'typescript.tsx', 'tsx' } },
}
