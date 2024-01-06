local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local telescope = require('telescope')

-- ----------------------------------------------------------------------------
-- Setup
-- ----------------------------------------------------------------------------
telescope.setup({
  defaults = {
    layout_strategy = 'bottom_pane',
    sorting_strategy = 'ascending',
    layout_config = {},
    borderchars = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
    previewer = false,
    winblend = 10,
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ['<C-x>'] = actions.delete_buffer,
        ['<C-s>'] = actions.file_split,
        ['<M-p>'] = action_layout.toggle_preview,
        ['<C-y>'] = actions.preview_scrolling_up,
        ['<C-e>'] = actions.preview_scrolling_down,
        ['<PageUp>'] = actions.preview_scrolling_up,
        ['<PageDown>'] = actions.preview_scrolling_down,
      },
    },
  }
})
telescope.load_extension('vim_rtp')
telescope.load_extension('vim_docs')
telescope.load_extension("ui-select")

-- ----------------------------------------------------------------------------
-- Themes
-- ----------------------------------------------------------------------------
local cursor = function(opt)
  return require('telescope.themes').get_cursor(
    vim.tbl_deep_extend('force', {
      layout_config = { width = 60 },
      borderchars = {
        prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
        results = { ' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' },
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
vim.keymap.set('n', '<C-b>', builtins.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<C-g>', function() builtins.live_grep({ hidden = true }) end, { desc = "Telescope live_grep" })
vim.keymap.set('n', '<C-p>', function() builtins.git_files({show_untracked = true}) end, { desc = "Telescope find_files" })
vim.keymap.set('n', '<C-q>', builtins.quickfix, { desc = "Telescope quickfix" })
vim.keymap.set('n', '<C-t>', function() builtins.treesitter(cursor({ layout_config = { height = 0.4 } })) end,
  { desc = "Telescope treesitter" })

vim.keymap.set('n', '<leader>fc', builtins.commands, { desc = "Telescope commands" })
vim.keymap.set('n', '<leader>fs', builtins.lsp_workspace_symbols, { desc = "Telescope LSP Symbols" })
vim.keymap.set('n', '<leader>fd', builtins.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set('n', '<leader>ff', builtins.builtin, { desc = "Telescope builtin" })
vim.keymap.set('n', '<leader>fe', function() builtins.symbols(cursor()) end, { desc = "Telescope symbols" })
vim.keymap.set('n', '<leader>fh', builtins.help_tags, { desc = "Telescope help_tags" })
vim.keymap.set('n', '<leader>fm', builtins.keymaps, { desc = "Telescope keymaps" })
vim.keymap.set('n', '<leader>fv', function() builtins.find_files({ cwd = "~/.config/", hidden = true }) end,
  { desc = "Find in .config" })

local find_rails_files = function (class_type)
  return function ()
    builtins.find_files({search_dirs = {'./app/' .. class_type}})
  end
end

vim.keymap.set('n', '<leader>rc', find_rails_files('controllers'), { desc = "Find Rails Controllers" })
vim.keymap.set('n', '<leader>rm', find_rails_files('models'), { desc = "Find Rails Models" })
vim.keymap.set('n', '<leader>rv', find_rails_files('views'), { desc = "Find Rails Views" })
vim.keymap.set('n', '<leader>rg', function()
  local gem_paths = vim.split(os.getenv('GEM_PATH'), ':', true)
  local search_dirs = vim.tbl_map(function (path)
    return path .. '/gems'
  end, gem_paths)
  -- builtins.live_grep({search_dirs = gem_paths, type = 'ruby'})
  builtins.find_files({search_dirs = search_dirs})
end, { desc = "Telescope Find in gems" })

vim.keymap.set('n', '<leader>gS', function() builtins.git_status({ layout_config = { height = 0.9 } }) end,
  { desc = "Telescope git_status" })
vim.keymap.set('n', '<leader>gc', function() builtins.git_bcommits({ layout_config = { height = 0.9 } }) end,
  { desc = "Telescope git_bcommits" })
vim.keymap.set('n', '<leader>gB', builtins.git_branches, { desc = "Telescope git_branches" })

vim.keymap.set('i', '<C-m>', function() builtins.symbols(cursor({ sources = { 'emoji', 'kaomoji', 'gitmoji' } })) end,
  { desc = "Telescope symbols" })

vim.cmd [[cabbrev t Telescope]]

-- ----------------------------------------------------------------------------
-- vim.ui.select
-- ----------------------------------------------------------------------------
-- TODO: Setup select with the function from dressing.nvim
-- https://github.com/stevearc/dressing.nvim/blob/master/lua/dressing/select/telescope.lua
