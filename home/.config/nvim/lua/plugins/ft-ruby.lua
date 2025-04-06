local function configVimRails()
  -- vim.g.rails_projections = {
  --   ['packs/*/app/controllers/**_controller.rb'] = {
  --     type = 'controller',
  --     alternate = {
  --       'packs/{dirname}/app/helpers/{basename}_helper.rb',
  --       'packs/{dirname}/spec/controllers/{basename}_controller_spec.rb',
  --       'packs/{dirname}/test/controllers/{basename}_controller_test.rb',
  --     },
  --     related = {
  --       'packs/{dirname}/app/models/{singular}.rb',
  --       'packs/{dirname}/app/views/{basename}/*',
  --     },
  --     template = {
  --       'class {camelcase|capitalize|colons}Controller < ApplicationController',
  --       'end',
  --     },
  --   },
  -- }
  vim.keymap.set('n', '<leader>ri', ':Eschema<space>', { desc = 'Edit Rails schema' })
end

return {
  { 'mikepjb/vim-chruby', ft = { 'ruby' } },
  { 'noprompt/vim-yardoc', ft = { 'ruby' } },
  { 'tpope/vim-bundler', ft = { 'ruby' } },
  -- See the Rails-related Telescope finders in telescope.lua
  { 'tpope/vim-rails', ft = { 'ruby' }, config = configVimRails },
  { 'rbong/vim-flog', ft = { 'ruby' } },
  { 'tpope/vim-ragtag', ft = { 'eruby', 'html', 'xml', 'javascript.jsx', 'jsx', 'typescript.tsx', 'tsx' } },
}
