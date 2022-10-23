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

  local luaDevOptions = function()
    local lsp = require('lspconfig')
    return require("lua-dev").setup({
      lspconfig = vim.tbl_deep_extend(
        'keep',
        defaultOptions,
        { root_dir = lsp.util.root_pattern('.nvim-root') }
      )
    })
  end

  local config = function()
    local lsp = require('lspconfig')

    -- Lua gets some additional fields
    lsp.sumneko_lua.setup(luaDevOptions())

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
      'yamlls'
    }
    for _, server in pairs(servers) do
      lsp[server].setup(defaultOptions)
    end
  end

  config()
end
