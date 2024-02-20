local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or require('geri.border').thin
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

return function()
  local defaultOptions = {
    on_attach = require('geri.config.lsp-on-attach'),
  }

  local config = function()
    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    require("neodev").setup({})

    -- Lua gets some additional fields
    local lsp = require('lspconfig')
    lsp.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = { globals = {  'vim' },
          completion = { callSnippet = "Replace" }
        }
      }
    }})

    -- Here's the list of available LSP servers
    -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
    local servers = {
      'vimls',
      'bashls',
      'clangd',
      'solargraph',
      -- 'ruby_ls',
      'dockerls',
      'gopls',
      'html',
      'jsonls',
      'pylsp',
      'terraformls',
      'tsserver',
      'yamlls',
      'tailwindcss'
    }
    for _, server in pairs(servers) do
      lsp[server].setup(defaultOptions)
    end
  end

  config()
end
