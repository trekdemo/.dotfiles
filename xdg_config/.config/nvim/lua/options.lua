-- Spelling should be disabled by default
-- when enabled use English and only the 9 best suggestions
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.spellsuggest = "best,9"
vim.opt.langmenu = "en_US.UTF-8"

-- Mouse
vim.opt.mouse = "a"

-- Command line behaviour
vim.opt.showmode = false -- Don't display -- INSERT -- in status line
vim.opt.cmdheight = 1

-- Text flow
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Line numbers
vim.opt.number = true
vim.opt.numberwidth = 6
vim.opt.cursorline = true

-- Scroll behaviour
vim.opt.scrolloff = 5
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 2

-- Splits
vim.opt.splitright = true -- New split window on the right
vim.opt.splitbelow = true -- New split window on the bottom

-- Folds
vim.opt.foldenable = true
vim.opt.foldlevel = 999999
vim.opt.foldlevelstart = 10
vim.opt.foldtext = "folding#text()"

-- Completion
vim.opt.complete = table.concat(vim.opt.complete, "kspell")
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10

-- Settings
vim.opt.hidden = true -- Edited files can be in hidden buffers
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.diffopt = "filler,internal,algorithm:histogram,indent-heuristic,iwhite"
vim.opt.virtualedit = table.concat(vim.opt.virtualedit, "block")                  -- Allow to move the cursor everywhere,
vim.opt.list = true                                -- Show invisible characters not just existing text
vim.opt.listchars = "tab:⇥ ,trail:·,extends:❯,precedes:❮"
vim.opt.fillchars="diff:⣿,vert:│,eob: "     -- Comment needed to allow empty eob char
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"     -- Don't show hidden characters in normal mode
vim.opt.inccommand = "nosplit"                  -- Show substitution in realtime
vim.opt.clipboard = table.concat(vim.opt.clipboard, "unnamedplus")
