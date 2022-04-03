local M = {}

function M.config ()
  -- Here's the list of available LSP servers
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  local lsp = require('lspconfig')
  local options = {
    on_attach = require('geri.config.lsp-on-attach'),
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
  }

  local servers = { 'vimls', 'bashls', 'cssls', 'solargraph', 'dockerls', 'gopls', 'html', 'jsonls', 'pylsp', 'terraformls', 'tsserver', 'yamlls' }
  for _, server in pairs(servers) do
    lsp[server].setup(options)
  end

  -- Configure Lua
  local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-language-server'
  local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"
  local luadev = require("lua-dev").setup({
    lspconfig = vim.tbl_deep_extend('keep', options, {
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      root_dir = lsp.util.root_pattern('.nvim-root')
    })
  })
  lsp.sumneko_lua.setup(luadev)

  vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn",  { text = "", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo",  { text = "", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint",  { text = "", texthl = "DiagnosticSignHint" })
end

return M
