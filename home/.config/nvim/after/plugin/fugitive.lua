local vim = vim
vim.cmd.cabbrev('g', 'Git')

vim.keymap.set('n', '<leader>g<Space>', ':Git<Space>')
vim.keymap.set('n', '<leader>gs', ':Git<cr>')
vim.keymap.set('n', '<leader>gg', ':Git<cr>')
vim.keymap.set('n', '<leader>gw', ':Gwrite<cr>')
vim.keymap.set('n', '<leader>ga', ':Gadd<cr>')
vim.keymap.set('n', '<leader>gb', ':Git blame')
vim.keymap.set('n', '<leader>gl', ':Git log')
vim.keymap.set('n', '<leader>gP', ':!gh pr view -w || gh pr create -w<cr>')

local augrp = vim.api.nvim_create_augroup("FugitiveUserMappings", {})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augrp,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()

    vim.keymap.set("n", "g<space>", ':Git ', { buffer = bufnr, remap = false, desc = "Git " })

    vim.keymap.set("n", "<leader>p", function()
      vim.cmd ':Git push'
    end, { buffer = bufnr, remap = false, desc = "Git push" })

    -- rebase always
    vim.keymap.set("n", "<leader>P", function()
      vim.cmd ':Git pull --rebase'
    end, { buffer = bufnr, remap = false, desc = "Git pull --rebase" })
  end,
})
