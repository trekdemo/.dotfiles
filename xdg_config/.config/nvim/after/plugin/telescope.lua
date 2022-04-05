local actions = require("telescope.actions")
local telescope = require('telescope')
telescope.setup({
  defaults = {
    layout_strategy = 'horizontal',
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ['<c-d>'] = actions.delete_buffer,
      },
    },
  }
})
telescope.load_extension('vim_rtp')
telescope.load_extension('vim_docs')

-- ----------------------------------------------------------------------------
-- Themes
-- ----------------------------------------------------------------------------
local themes = require('telescope.themes')
local theme_defaults = {
  borderchars = {
    prompt = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
    results = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
    preview = {'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' },
  },
  results_title = '',
  preview_title = '',
  winblend = 15,
}
local full = function(opt)
  opt = opt or {}
  return themes.get_dropdown(
    vim.tbl_deep_extend('force', theme_defaults, {
      width = 0.8,
      show_line = false,
      layout_strategy = 'horizontal',
      layout_config = {
        width = 0.8,
        height = 0.9,
        prompt_position = "top",
        preview_cutoff = 120,
      }
    }, opt)
  )
end
local cursor = function()
  return themes.get_cursor(
    vim.tbl_deep_extend('force', theme_defaults, {
      layout_config = { width = 60 },
      previewer = false,
      prompt_title = false
    })
  )
end
local center = function(opt)
  opt = opt or {}
  return themes.get_dropdown(
    vim.tbl_deep_extend('force', theme_defaults, {
      layout_strategy = 'center',
      layout_config = {
        width = 0.8,
        height = 0.5,
      },
      previewer = false,
      prompt_title = false
    }, opt)
  )
end
local ivy = function(opt)
  opt = opt or {}
  return themes.get_ivy(
    vim.tbl_deep_extend('force', theme_defaults, opt)
  )
end

-- ----------------------------------------------------------------------------
-- Keymaps
-- ----------------------------------------------------------------------------
local builtins = require('telescope.builtin')
require('which-key').register({
  ['<C-p>'] = { function() builtins.find_files(full()) end, "Find files" },
  ['<C-b>'] = { function() builtins.buffers(full()) end, "Buffers" },
  ['<M-b>'] = { function() builtins.builtin(center()) end, "Builtins" },
  ['<leader>f'] = {
    name = "+telescope",
    a = { function() builtins.lsp_code_actions(cursor()) end, "LSP: Code Actions" },
    c = { function() builtins.commands(full()) end, "Commands" },
    e = { function() builtins.symbols(cursor()) end, "Emojies" },
    g = { function() builtins.git_status(ivy()) end, "Git Status" },
    h = { function() builtins.help_tags(full()) end, "Help Tags" },
    m = { function() builtins.keymaps(ivy()) end, "Keymaps" },
    t = { function() builtins.treesitter(center()) end, "TreeSitter" },
    v = { function() builtins.find_files(full({cwd="~/.config/nvim"})) end, "NVim Configuration" },
    r = { function() builtins.lsp_references(ivy()) end, 'LSP: References'}
  },
}, {noremap = true})

vim.cmd [[
cabbrev t Telescope
inoremap <C-e>      <cmd>Telescope symbols<cr>
]]
