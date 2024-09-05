return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nav = require 'nvim-tmux-navigation'
    nav.setup {
      disable_when_zoomed = false, -- Default: false
    }

    local map = vim.keymap.set
    local options = { noremap = true, silent = true }
    map('n', '<C-h>', nav.NvimTmuxNavigateLeft, options)
    map('n', '<C-j>', nav.NvimTmuxNavigateDown, options)
    map('n', '<C-k>', nav.NvimTmuxNavigateUp, options)
    map('n', '<C-l>', nav.NvimTmuxNavigateRight, options)

    map('n', '<C-Left>', nav.NvimTmuxNavigateLeft, options)
    map('n', '<C-Down>', nav.NvimTmuxNavigateDown, options)
    map('n', '<C-Up>', nav.NvimTmuxNavigateUp, options)
    map('n', '<C-Right>', nav.NvimTmuxNavigateRight, options)
    -- vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
    map('t', '<C-h>', '<C-\\><C-n><C-h>', { silent = true })
    map('t', '<C-j>', '<C-\\><C-n><C-j>', { silent = true })
    map('t', '<C-k>', '<C-\\><C-n><C-k>', { silent = true })
    map('t', '<C-l>', '<C-\\><C-n><C-l>', { silent = true })

    map('t', '<C-Left>', '<C-\\><C-n><C-h>', { silent = true })
    map('t', '<C-Down>', '<C-\\><C-n><C-j>', { silent = true })
    map('t', '<C-Up>', '<C-\\><C-n><C-k>', { silent = true })
    map('t', '<C-Right>', '<C-\\><C-n><C-l>', { silent = true })
  end,
}
