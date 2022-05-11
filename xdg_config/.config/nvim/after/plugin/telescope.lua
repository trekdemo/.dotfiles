local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local telescope = require('telescope')
telescope.setup({
  defaults = {
    layout_strategy = 'bottom_pane',
    sorting_strategy = 'ascending',
    layout_config = { },
    borderchars = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
    previewer = false,
    winblend = 15,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ['<c-d>'] = actions.delete_buffer,
        ['<C-p>'] = action_layout.toggle_preview,
      },
    },
  }
})
telescope.load_extension('vim_rtp')
telescope.load_extension('vim_docs')

-- ----------------------------------------------------------------------------
-- Themes
-- ----------------------------------------------------------------------------
local cursor = function(opt)
  return require('telescope.themes').get_cursor(
    vim.tbl_deep_extend('force', {
      layout_config = { width = 60 },
      borderchars = {
        prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
        results = {' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' },
      },
      previewer = false,
      results_title = '',
    }, opt or {})
  )
end

-- ----------------------------------------------------------------------------
-- Keymaps
-- ----------------------------------------------------------------------------
local builtins = require('telescope.builtin')
require('which-key').register({
  ['<C-p>'] = { function() builtins.find_files() end, "Find files" },
  ['<C-b>'] = { function() builtins.buffers() end, "Buffers" },
  ['<C-q>'] = { function() builtins.quickfix() end, "Quickfix" },
  ['<C-g>'] = { function() builtins.live_grep({hidden = true}) end, "Live grep" },
  ['<C-t>'] = { function() builtins.treesitter(cursor({layout_config = {height = 15}})) end, "TreeSitter" },
  ['<M-b>'] = { function() builtins.builtin() end, "Builtins" },
  ['<leader>f'] = {
    name = "+telescope",
    a = { function() builtins.lsp_code_actions(cursor()) end, "LSP: Code Actions" },
    c = { function() builtins.commands() end, "Commands" },
    d = { function() builtins.diagnostics() end, 'Diagnostics'},
    e = { function() builtins.symbols(cursor()) end, "Emojies" },
    g = {
      name = "+git",
      s = { function() builtins.git_status({layout_config = {height = 0.9}}) end, "Git Status" },
      c = { function() builtins.git_bcommits({layout_config = {height = 0.9}}) end, "Git Commits" },
      b = { function() builtins.git_branches() end, "Git Branches" },
    },
    h = { function() builtins.help_tags() end, "Help Tags" },
    m = { function() builtins.keymaps() end, "Keymaps" },
    r = { function() builtins.lsp_references() end, 'LSP: References'},
    v = { function() builtins.find_files({cwd = "~/.dotfiles/", hidden = true}) end, "Dotfiles" },
  },
  ['gr'] = { function() builtins.lsp_references() end, 'LSP: References'},
}, {noremap = true})

vim.cmd [[
cabbrev t Telescope
inoremap <C-e>      <cmd>Telescope symbols<cr>
]]
