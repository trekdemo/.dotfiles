local M = {}

local defaultOptions = function ()
  return {
    on_attach = require('geri.config.lsp-on-attach'),
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
  }
end

local luaDevOptions = function()
  local lsp = require('lspconfig')
  local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-language-server'
  local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"

  return require("lua-dev").setup({
    lspconfig = vim.tbl_deep_extend(
      'keep',
      defaultOptions(),
      {
        cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
        root_dir = lsp.util.root_pattern('.nvim-root')
      }
    )
  })
end

function M.config ()
  local lsp = require('lspconfig')

  -- Here's the list of available LSP servers
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  local servers = { 'vimls', 'bashls', 'cssls', 'solargraph', 'dockerls', 'gopls', 'html', 'jsonls', 'pylsp', 'terraformls', 'tsserver', 'yamlls' }
  for _, server in pairs(servers) do
    lsp[server].setup(defaultOptions())
  end
  -- Lua gets some additional fields
  lsp.sumneko_lua.setup(luaDevOptions())

  vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn",  { text = "", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo",  { text = "", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint",  { text = "", texthl = "DiagnosticSignHint" })
end


return M
