local M = {}

M.config = function ()
  local map = function(type, key, value)
    vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
  end

  -- https://github.com/neovim/nvim-lspconfig
  local custom_attach = function(client)
    print("LSP started.");

    map('n', '1gD'  , '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    map('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    map('n', 'K'    , '<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n', 'g0'   , '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n', 'gi'   , '<cmd>lua vim.lsp.buf.implementation()<CR>')
    map('n', 'gW'   , '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    map('n', 'gd'   , '<cmd>lua vim.lsp.buf.declaration()<CR>')
    map('n', 'gr'   , '<cmd>lua vim.lsp.buf.references()<CR>')

    map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
  end

  local lsp = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  -- Here's the list of available LSP servers
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  lsp.bashls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.dockerls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.gopls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.html.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.jsonls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.solargraph.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.vimls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.terraformls.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.pylsp.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
  lsp.yamlls.setup({
    on_attach=custom_attach,
    capabilities = capabilities,
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = false,
      }
    },
  })

  local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-language-server'
  local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  local library = {}

  local function add(lib)
    for _, p in pairs(vim.fn.expand(lib, false, true)) do
      p = vim.loop.fs_realpath(p)
      library[p] = true
    end
  end

  -- add runtime
  add("$VIMRUNTIME")

  -- add your config
  add("~/.config/nvim")

  -- add plugins
  add(vim.fn.stdpath('data') .. "/site/pack/packer/opt/*")
  add(vim.fn.stdpath('data') .. "/site/pack/packer/start/*")

  lsp.sumneko_lua.setup {
    on_attach=custom_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    capabilities = capabilities,
    -- delete root from workspace to make sure we don't trigger duplicate warnings
    on_new_config = function(config, root)
      local libs = vim.tbl_deep_extend("force", {}, library)
      libs[root] = nil
      config.settings.Lua.workspace.library = libs
      return config
    end,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
        -- completion = { keywordSnippet = "Disable", },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
          library = library,
          maxPreload = 2000,
          preloadFileSize = 50000
        }
      }
    }
  }

  vim.cmd [[
    sign define LspDiagnosticsSignError text=ﱥ texthl=LspDiagnosticsSignError linehl= numhl=
    sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
    sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
    sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
  ]]
end

return M
