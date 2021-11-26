vim.opt_local.number = false
vim.opt_local.relativenumber = false
vim.api.nvim_buf_set_keymap(0,  "n", "q", ":echo 'Use gq to delete the buffer'<CR>", { silent = true })
vim.api.nvim_buf_set_keymap(0,  "n", "gq", ":bdelete<CR>", { silent = true })
