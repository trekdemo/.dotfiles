vim.cmd('command! BufOnly silent! execute "%bd|e#|bd#"')
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>')

require('bufferline').setup({
  options = {
    max_name_length = 30,
    show_close_icon = false,
    custom_filter = function(buf)
      local curr_tab_id = vim.fn.tabpagenr()
      local tab_count = vim.fn.tabpagenr('$')

      if curr_tab_id == 1 or tab_count == 1 then
        return true
      end
      -- Only show buffers in the current tab
      if vim.tbl_contains(vim.fn.tabpagebuflist(), buf) then
        return true
      end

      return false
    end,
  },
})
