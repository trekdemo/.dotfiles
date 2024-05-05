--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin
return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-project.nvim',
    { -- If encountering errors, see telescope-fzf-native README for install instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires special font.
    --  If you already have a Nerd Font, or terminal set up with fallback fonts
    --  you can enable this
    -- { 'nvim-tree/nvim-web-devicons' }
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of help_tags options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-d>'] = 'delete_buffer',
            },
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        project = {
          base_dirs = {
            '~/projects',
          },
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'project')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<C-g>', function()
      builtin.live_grep { hidden = true }
    end, { desc = 'Telescope live_grep' })
    vim.keymap.set('n', '<C-p>', function()
      builtin.git_files { show_untracked = true }
    end, { desc = 'Telescope find_files' })
    vim.keymap.set('n', '<C-q>', builtin.quickfix, { desc = 'Telescope quickfix' })
    vim.keymap.set('n', '<C-t>', function()
      builtin.treesitter()
    end, { desc = 'Telescope treesitter' })

    vim.keymap.set('n', '<leader>fp', require('telescope').extensions.project.project, { desc = 'Find [P]roject' })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Find [C]ommands' })
    vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, { desc = 'Find LSP [S]ymbols' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope [D]iagnostics' })
    vim.keymap.set('n', '<leader>ff', builtin.builtin, { desc = 'Telescope builtin' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope builtin' })
    vim.keymap.set('n', '<leader>fe', function()
      builtin.symbols()
    end, { desc = 'Telescope symbols' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find [H]elp' })
    vim.keymap.set('n', '<leader>fm', builtin.keymaps, { desc = 'Find key [M]appings' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find [R]esume' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>fv', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[F]ind in Neo[V]im files' })

    vim.keymap.set('n', '<leader>gS', function()
      builtin.git_status { layout_config = { height = 0.9 } }
    end, { desc = 'Telescope git_status' })
    vim.keymap.set('n', '<leader>gc', function()
      builtin.git_bcommits { layout_config = { height = 0.9 } }
    end, { desc = 'Telescope git_bcommits' })
    vim.keymap.set('n', '<leader>gB', builtin.git_branches, { desc = 'Telescope git_branches' })

    vim.cmd [[cabbrev t Telescope]]

    vim.keymap.set('n', '<leader>rg', function()
      local gem_paths = vim.split(os.getenv 'GEM_PATH', ':', { trimempty = true })
      local search_dirs = vim.tbl_map(function(path)
        return path .. '/gems'
      end, gem_paths)
      -- builtins.live_grep({search_dirs = gem_paths, type = 'ruby'})
      builtin.find_files { search_dirs = search_dirs }
    end, { desc = 'Telescope Find in gems' })
  end,
}
