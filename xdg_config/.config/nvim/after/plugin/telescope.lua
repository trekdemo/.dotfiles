local actions = require("telescope.actions")
local telescope = require('telescope')
telescope.setup({
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
telescope.load_extension('vim_rtp')
telescope.load_extension('vim_docs')

vim.cmd [[
cabbrev t Telescope
nnoremap <C-p>      <cmd>Telescope find_files<cr>
nnoremap <leader>fp <cmd>Telescope projects<cr>
nnoremap <C-b>      <cmd>Telescope buffers<cr>
nnoremap <leader>fa <cmd>Telescope lsp_code_actions layout_strategy=cursor<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fe <cmd>Telescope symbols<cr>
inoremap <C-e>      <cmd>Telescope symbols<cr>
nnoremap <leader>fv <cmd>Telescope find_files cwd=~/.config/nvim<cr>
nnoremap <leader>wf <cmd>Telescope find_files cwd=~/Documents/Notes<cr>
nnoremap <leader>wg <cmd>Telescope live_grep cwd=~/Documents/Notes<cr>
nnoremap <leader>fg <cmd>Telescope git_status<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope keymaps<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
nnoremap <leader>fo <cmd>lua require("neorg.modules.core.integrations.telescope.module").public.find_linkable()<cr>
]]
