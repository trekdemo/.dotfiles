return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nav = require 'nvim-tmux-navigation'
    nav.setup {
      disable_when_zoomed = false, -- Default: false
    }

    local map = vim.keymap.set
    local options = { noremap = true, silent = true }
    map('n', '<A-h>', nav.NvimTmuxNavigateLeft, options)
    map('n', '<A-j>', nav.NvimTmuxNavigateDown, options)
    map('n', '<A-k>', nav.NvimTmuxNavigateUp, options)
    map('n', '<A-l>', nav.NvimTmuxNavigateRight, options)

    map('n', '<A-Left>', nav.NvimTmuxNavigateLeft, options)
    map('n', '<A-Down>', nav.NvimTmuxNavigateDown, options)
    map('n', '<A-Up>', nav.NvimTmuxNavigateUp, options)
    map('n', '<A-Right>', nav.NvimTmuxNavigateRight, options)
    -- vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
    map('t', '<M-h>', '<C-\\><C-n><C-h>', { silent = true })
    map('t', '<M-j>', '<C-\\><C-n><C-j>', { silent = true })
    map('t', '<M-k>', '<C-\\><C-n><C-k>', { silent = true })
    map('t', '<M-l>', '<C-\\><C-n><C-l>', { silent = true })

    map('t', '<M-Left>', '<C-\\><C-n><C-h>', { silent = true })
    map('t', '<M-Down>', '<C-\\><C-n><C-j>', { silent = true })
    map('t', '<M-Up>', '<C-\\><C-n><C-k>', { silent = true })
    map('t', '<M-Right>', '<C-\\><C-n><C-l>', { silent = true })
  end,
}
