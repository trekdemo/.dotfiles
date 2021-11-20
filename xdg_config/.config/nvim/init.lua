-- The runs on the very first time a vim installation is used
if require("geri.first_run")() then
  return
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require "geri.globals"
