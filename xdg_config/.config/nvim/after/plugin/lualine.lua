-- https://github.com/nvim-lualine/lualine.nvim#configuring-lualine-in-initvim
local colors = require "material.colors"
local theme = require('lualine.themes.material-stealth')
theme.normal.a.bg = colors.editor.bg_alt
theme.normal.b.bg = colors.editor.bg_alt
theme.normal.c.bg = colors.editor.bg_alt
theme.inactive.a.bg = colors.editor.bg_alt
theme.inactive.b.bg = colors.editor.bg_alt
theme.inactive.c.bg = colors.editor.bg_alt

require('lualine').setup{
  options = {
    theme = theme,
    globalstatus = false,
    -- component_separators = { left = '│', right = '│' },
    component_separators = { left = '', right = '' },
    section_separators  = { left = '', right = ''},
    -- component_separators = { left = '\\', right = '/'},
    -- component_separators= { left = '▐', right = '▌' },
    -- section_separators = { left = '', right = '' },
    -- section_separators = { left = '▕', right = '▏' },
    -- section_separators = { left = '▐', right = '▌' },
    -- section_separators = { left = '▐│', right = '│▌' },
  },

  tabline = {
    lualine_a = {

      -- {
      --   'branch',
      --   on_click = function () require('telescope.builtin').git_branches() end
      -- },
      { 'tabs', mode = 0, },
    },
    lualine_b = {
      { 'windows', mode = 0, },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      { 'lsp_progress', spinner_symbols = {"🤘 ", "🤟 ", "🖖 ", "✋ ", "🤚 ", "👆 "} }
    },
  },

  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,3) end },
    },
    lualine_b = {
      {'filetype', icon_only = true, colored = true},
      -- { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
      { 'filename', path = 1, symbols = { modified = '  ', readonly = ' ' } },
      {
        'diff',
        symbols = {added = ' ', removed = ' ', modified = ' '},
        on_click = function () vim.cmd([[:Git]]) end
      },
      { 'diagnostics', on_click = function () require('telescope.builtin').diagnostics() end },
    },
    lualine_c = { },
    lualine_x = { },
    lualine_y = { 'location' },
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1,3) end },
    },
    lualine_b = {
      {'filetype', icon_only = true, colored = false},
      -- { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
      { 'filename', path = 1, symbols = { modified = '  ', readonly = ' ' } },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'quickfix', 'fugitive'},
}
