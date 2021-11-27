local util = require('utils')
util.nnoremap('gb', ':BufferLinePick<CR>')
util.nnoremap('<leader>bd', ':BufferLinePickClose<CR>')
util.nnoremap('<leader>bD', ':bdelete<CR>')

vim.cmd('command! BufOnly silent! execute "%bd|e#|bd#"')
util.nnoremap('<leader>bo', ':BufOnly<CR>')

require('bufferline').setup({
  options = {
    max_name_length = 30,
    show_close_icon = false,
    custom_filter = function(buf)
      local ignored_ft = { 'help', 'fugitive', 'term', 'neoterm', 'netrw' }
      if vim.tbl_contains(ignored_ft, vim.bo[buf].filetype) then
        return false
      end

      return true
    end,
  },
})
