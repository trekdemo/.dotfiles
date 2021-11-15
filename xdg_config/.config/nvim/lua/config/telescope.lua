local M = {}

M.config = function ()
  local actions = require("telescope.actions")
  require('telescope').setup({
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        mirror = true,
      },
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ['<c-d>'] = actions.delete_buffer,
        },
      },
    }
  })

  vim.cmd [[
    cabbrev t Telescope
    nnoremap <leader>fa <cmd>Telescope lsp_code_action<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fc <cmd>Telescope commands<cr>
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fv <cmd>Telescope find_files cwd=~/.config/nvim<cr>
    nnoremap <leader>fg <cmd>Telescope git_status<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <leader>fm <cmd>Telescope keymaps<cr>
    nnoremap <leader>ft <cmd>Telescope treesitter<cr>
  ]]
end

return M
