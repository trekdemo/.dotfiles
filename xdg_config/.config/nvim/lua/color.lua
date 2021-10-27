vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd [[
  colorscheme gruvbox

  " Make the background transparent
  hi Normal      guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]]
