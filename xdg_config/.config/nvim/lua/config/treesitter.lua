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
    ensure_installed = { "ruby", "yaml", "sql", "go", "query", "html", "css", "lua", "vim", "bash", "javascript", "typescript" },

    highlight = { enable = true },
    indent = { enable = true },

    -- https://github.com/RRethy/nvim-treesitter-textsubjects#quick-start
    textsubjects = {
      enable = true,
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
      }
    },

    -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,

        goto_next_start = {
          ["]]"] = "@function.outer",
          -- ["]m"] = "@function.outer",
          -- ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]["] = "@function.outer",
          -- ["]M"] = "@function.outer",
          -- ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
          -- ["[m"] = "@function.outer",
          -- ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
          -- ["[M"] = "@function.outer",
          -- ["[]"] = "@class.outer",
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

  local u = require('utils')
  u.nmap("[[", "[[zz")
  u.nmap("]]", "]]zz")
  u.nmap("][", "][zz")
  u.nmap("[]", "[]zz")
end

return M
