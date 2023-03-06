local list = require("nvim-treesitter.parsers").get_parser_configs()

list.sql = {
  install_info = {
    url = "https://github.com/DerekStride/tree-sitter-sql",
    files = { "src/parser.c" },
    branch = "main",
  },
}

local _ = require("nvim-treesitter.configs").setup {
  ensure_installed = { "help", "ruby", "json", "yaml", "sql", "go", "query",
    "html", "css", "lua", "vim", "bash", "javascript", "typescript", "tsx", "c",
    "make", "markdown", "markdown_inline", "diff", "python", "mermaid" },

  indent = { enable = true },
  highlight = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },

  -- https://github.com/nvim-treesitter/playground
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

  -- https://github.com/RRethy/nvim-treesitter-textsubjects#quick-start
  textsubjects = {
    enable = true,
    prev_selection = ',',
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-inner',
      -- ['o;'] = 'textsubjects-container-outer',
    },
  },


  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/master/queries
        ["am"] = { query = "@function.outer", desc = "a function definition" },
        ["im"] = { query = "@function.inner", desc = "a function body"},
        ["ac"] = { query = "@class.outer", desc = "a class" },
        ["ic"] = { query = "@class.inner", desc = "inner class" },
        ["id"] = { query = "@block.inner", desc = "inner block" },
        ["ad"] = { query = "@block.outer", desc = "a block" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@function.outer'] = 'V',
        ['@class.outer'] = 'V',
      },
    },

    move = {
      enable = true,
      set_jumps = true,

      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]]"] = "@structure.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]C"] = "@class.outer",
        ["]["] = "@structure.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[["] = "@structure.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[C"] = "@class.outer",
        ["[]"] = "@structure.outer",
      },
    },
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
