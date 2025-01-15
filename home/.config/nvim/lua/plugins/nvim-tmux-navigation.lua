return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nav = require 'nvim-tmux-navigation'
    nav.setup {
      disable_when_zoomed = false, -- Default: false
    }

    local map = vim.keymap.set
    local options = { noremap = true, silent = true }
    map('n', '<M-h>', nav.NvimTmuxNavigateLeft, options)
    map('n', '<M-j>', nav.NvimTmuxNavigateDown, options)
    map('n', '<M-k>', nav.NvimTmuxNavigateUp, options)
    map('n', '<M-l>', nav.NvimTmuxNavigateRight, options)

    map('n', '<M-Left>', nav.NvimTmuxNavigateLeft, options)
    map('n', '<M-Down>', nav.NvimTmuxNavigateDown, options)
    map('n', '<M-Up>', nav.NvimTmuxNavigateUp, options)
    map('n', '<M-Right>', nav.NvimTmuxNavigateRight, options)
    -- vim.api.nvim_set_keymap('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { noremap = true, silent = true })
    map('t', '<M-h>', '<C-\\><C-n><M-h>', { silent = true })
    map('t', '<M-j>', '<C-\\><C-n><M-j>', { silent = true })
    map('t', '<M-k>', '<C-\\><C-n><M-k>', { silent = true })
    map('t', '<M-l>', '<C-\\><C-n><M-l>', { silent = true })

    map('t', '<M-Left>', '<C-\\><C-n><M-h>', { silent = true })
    map('t', '<M-Down>', '<C-\\><C-n><M-j>', { silent = true })
    map('t', '<M-Up>', '<C-\\><C-n><M-k>', { silent = true })
    map('t', '<M-Right>', '<C-\\><C-n><M-l>', { silent = true })
  end,
}
