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
  ['<M-b>'] = { function() builtins.builtin() end, "Builtins" },
  ['<leader>f'] = {
    name = "+telescope",
    a = { function() builtins.lsp_code_actions(cursor()) end, "LSP: Code Actions" },
    c = { function() builtins.commands() end, "Commands" },
    e = { function() builtins.symbols(cursor()) end, "Emojies" },
    g = { function() builtins.git_status() end, "Git Status" },
    h = { function() builtins.help_tags() end, "Help Tags" },
    m = { function() builtins.keymaps() end, "Keymaps" },
    t = { function() builtins.treesitter(cursor({layout_config = {height = 15}})) end, "TreeSitter" },
    v = { function() builtins.find_files({cwd="~/.config/nvim"}) end, "NVim Configuration" },
    r = { function() builtins.lsp_references() end, 'LSP: References'},
    d = { function() builtins.diagnostics() end, 'Diagnostics'},
  },
  ['gr'] = { function() builtins.lsp_references() end, 'LSP: References'},
}, {noremap = true})

vim.cmd [[
cabbrev t Telescope
inoremap <C-e>      <cmd>Telescope symbols<cr>
]]
