local opt = vim.opt

-- Colorscheme
opt.termguicolors = true
opt.background = "dark"

-- Spelling should be disabled by default
-- when enabled use English and only the 9 best suggestions
opt.spell = false
opt.spelllang = "en"
opt.spellsuggest = "best,9"

-- Mouse
opt.mouse = "a"

-- Command line behaviour
opt.showmode = false -- Don't display -- INSERT -- in status line
opt.cmdheight = 1

-- Text flow
opt.wrap = false
opt.textwidth = 80
opt.expandtab = true
opt.shiftround = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.cursorline = false
opt.signcolumn = 'yes'

-- Scroll behaviour
opt.scrolloff = 5
opt.sidescroll = 1
opt.sidescrolloff = 2

-- Splits
opt.splitright = true -- New split window on the right
opt.splitbelow = true -- New split window on the bottom

-- Folds
-- opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldtext = "folding#text()"
opt.foldenable = true

-- Completion
opt.complete = ".,w,b,u,t,kspell"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10
opt.pumblend = 10

-- Settings
opt.timeoutlen = 500
opt.updatetime = 500
opt.hidden = true -- Edited files can be in hidden buffers
opt.ignorecase = true
opt.smartcase = true
opt.diffopt = "filler,internal,algorithm:histogram,indent-heuristic,iwhite"
opt.virtualedit = 'block' -- Allow to move the cursor everywhere,
opt.fillchars = "diff:╱,vert:│,foldclose:,foldopen:,eob: " -- Comment needed to allow empty eob char
opt.conceallevel = 2
opt.concealcursor = "nc" -- Don't show hidden characters in normal mode
opt.clipboard = { 'unnamed', "unnamedplus" }
