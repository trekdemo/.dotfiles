-- https://github.com/nvim-lualine/lualine.nvim#configuring-lualine-in-initvim
require('lualine').setup{
  options = {
    globalstatus = true,
    -- component_separators = { left = '\\', right = '/'},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
  },
  tabline = {
    lualine_a = {
      {
        'vim.fs.basename(vim.fn.getcwd())',
        separator = '|',
      },
    },
    lualine_b ={{'tabs', mode = 2}},
    lualine_z = {},
  },
  winbar = {
    lualine_a = {},
    lualine_b = {
      {'filetype', icon_only = true, colored = false},
      -- { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
      { 'filename', path = 1, symbols = { modified = '  ', readonly = ' ' } },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_b = {
      {'filetype', icon_only = true, colored = false},
      -- { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
      { 'filename', path = 1, symbols = { modified = '  ', readonly = ' ' } },
    },
    lualine_c = {},
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1,1) end } },
    lualine_b = {
      {
        'branch',
        on_click = function () require('telescope.builtin').git_branches() end
      },
      {
        'diff',
        symbols = {added = ' ', removed = ' ', modified = ' '},
        on_click = function ()
          vim.cmd([[:Git]])
        end
      },
    },
    lualine_c = {
      {'diagnostics', on_click = function () require('telescope.builtin').diagnostics() end}
    },
    lualine_x = {{ 'lsp_progress', spinner_symbols = {"🤘 ", "🤟 ", "🖖 ", "✋ ", "🤚 ", "👆 "} }},
    lualine_y = {
    },
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  extensions = {'quickfix', 'fugitive', 'toggleterm'},
}
