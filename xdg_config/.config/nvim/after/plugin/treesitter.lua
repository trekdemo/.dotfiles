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
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },

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

        -- markdown
        ["ili"] = "@list_item.inner",
        ["ali"] = "@list_item.outer",
        ["icb"] = "@code_block.inner",
        ["acb"] = "@code_block.outer",
      },
    },
  },
}

local u = require('utils')
u.nmap("[[", "[[zz")
u.nmap("]]", "]]zz")
u.nmap("][", "][zz")
u.nmap("[]", "[]zz")
