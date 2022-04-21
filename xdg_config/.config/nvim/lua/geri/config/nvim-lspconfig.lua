local border = {
      {'🭽', 'FloatBorder'},
      {'▔', 'FloatBorder'},
      {'🭾', 'FloatBorder'},
      {'▕', 'FloatBorder'},
      {'🭿', 'FloatBorder'},
      {'▁', 'FloatBorder'},
      {'🭼', 'FloatBorder'},
      {'▏', 'FloatBorder'},
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

return function()
  local defaultOptions = function ()
    return {
      on_attach = require('geri.config.lsp-on-attach'),
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      },
    }
  end

  local luaDevOptions = function ()
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

  local config = function ()
    local lsp = require('lspconfig')

    -- Lua gets some additional fields
    lsp.sumneko_lua.setup(luaDevOptions())

    -- Here's the list of available LSP servers
    -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
    local servers = { 'vimls', 'bashls', 'cssls', 'solargraph', 'dockerls', 'gopls', 'html', 'jsonls', 'pylsp', 'terraformls', 'tsserver', 'yamlls' }
    for _, server in pairs(servers) do
      lsp[server].setup(defaultOptions())
    end

    vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn",  { text = "", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo",  { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint",  { text = "", texthl = "DiagnosticSignHint" })
  end

  config()
end
