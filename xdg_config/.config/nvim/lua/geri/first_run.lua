local download_packer = function()
  if vim.fn.input "Download Packer? (y for yes)" ~= "y" then
    return
  end

  local install_directory = string.format("%s/site/pack/packer/opt", vim.fn.stdpath "data")

  vim.fn.mkdir(install_directory, "p")

  local out = vim.fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_directory .. "/packer.nvim"
  })

  print(out)
  print "Downloading packer.nvim..."
  print "( You'll need to restart now )"
end

return function()
  if not pcall(require, "packer") then
    download_packer()

    return true
  end

  return false
end
