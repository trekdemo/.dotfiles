local overrides_grp = vim.api.nvim_create_augroup("MyMaterialOverrides", {clear = true})
vim.api.nvim_create_autocmd("ColorScheme", {
  group = overrides_grp,
  pattern = {"material"},
  callback = function()
    vim.cmd [[
    highlight clear LspReferenceText
    highlight clear LspReferenceRead
    highlight clear LspReferenceWrite
    highlight link LspReferenceText Visual
    highlight link LspReferenceRead Visual
    highlight link LspReferenceWrite Visual
    ]]
  end,
})

local mf = require('material.functions')
vim.keymap.set('n', '<leader>mt', mf.find_style, {desc = 'Next material style'})

require('material').setup({
  contrast = {
    sidebars = false,
    floating_windows = true,
    line_numbers = false,
    sign_column = false,
    cursor_line = false,
    non_current_windows = false,
    popup_menu = false
  }, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree

  italics = {
    comments = true, -- Enable italic comments
    keywords = true, -- Enable italic keywords
    functions = false, -- Enable italic functions
    strings = false, -- Enable italic strings
    variables = false -- Enable italic variables
  },

  contrast_filetypes = { -- Specify which windows get the contrasted (darker) background
    'netrw',
    'help',
    'terminal',
    'packer',
    'qf',
    'OUTLINE',
    'fugitive',
    'gitcommit',
    'gitrebase',
    -- 'ruby.rspec',
  },
})

vim.g.material_style = "darker"
vim.cmd [[colorscheme material]]
