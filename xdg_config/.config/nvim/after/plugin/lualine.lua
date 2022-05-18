-- https://github.com/nvim-lualine/lualine.nvim#configuring-lualine-in-initvim
require('lualine').setup{
  options = {
    globalstatus = false,
    -- component_separators = { left = '\\', right = '/'},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1) end } },
    lualine_b = {
      {'branch', icon = ''},
      {'diff', symbols = {added = ' ', removed = ' ', modified = ' '}},
    },
    lualine_c = {
      {'filetype', icon_only = true},
      -- { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
      { 'filename', path = 1, symbols = { modified = '  ', readonly = ' ' } },
      'diagnostics',
    },
    lualine_x = {{ 'lsp_progress', spinner_symbols = {"🤘 ", "🤟 ", "🖖 ", "✋ ", "🤚 ", "👆 "} }},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {'quickfix', 'fugitive', 'toggleterm'},
}
