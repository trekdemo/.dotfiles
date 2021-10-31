local M = {}

M.config = function ()
  local list = require("nvim-treesitter.parsers").get_parser_configs()

  list.sql = {
    install_info = {
      url = "https://github.com/DerekStride/tree-sitter-sql",
      files = { "src/parser.c" },
      branch = "main",
    },
  }

  local _ = require("nvim-treesitter.configs").setup {
    ensure_installed = { "ruby", "yaml", "sql", "go", "query", "html", "css", "lua", "vim", "bash", "javascript" },

    highlight = { enable = true },
    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,

        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },

      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",

          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",

          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
        },
      },
    },
  }
end

return M
