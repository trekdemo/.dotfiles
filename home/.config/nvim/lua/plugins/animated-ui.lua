return {
  {
    'anuvyklack/windows.nvim',
    dependencies = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      require('windows').setup {
        ignore = {
          buftype = { 'quickfix' },
          filetype = { 'Neotest Summary', 'fugitiveblame' },
        },
      }

      vim.keymap.set('n', '<A-Enter>', '<Cmd>WindowsMaximize<CR>')
    end,
  },

  -- Neovide-like cursor animation
  {
    'sphamba/smear-cursor.nvim',
    enabled = not vim.g.neovide,
    opts = {
      -- Faster smear: https://github.com/sphamba/smear-cursor.nvim?tab=readme-ov-file#examples
      stiffness = 0.6,
      trailing_stiffness = 0.4,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
    },
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.animate').setup {
        cursor = { enable = false },
        resize = { enable = false },
      }
    end,
  },

  -- Noicer UI
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
        -- Lsp Progress is formatted using the builtins for lsp_progress. See
        -- config.format.builtin See the section on formatting for more details
        -- on how to customize.
        progress = { enabled = true },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- 'rcarriga/nvim-notify',
    },
  },
}
