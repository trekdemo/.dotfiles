local M = {}

M.config = function ()
  require('telescope').setup({
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        mirror = true,
      }
    }
  })

  vim.cmd [[
    cabbrev t Telescope
    nnoremap <leader>fa <cmd>Telescope lsp_code_action<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fc <cmd>Telescope commands<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope git_status<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>fm <cmd>Telescope keymaps<cr>
    nnoremap <leader>ft <cmd>Telescope treesitter<cr>
  ]]
end

return M
