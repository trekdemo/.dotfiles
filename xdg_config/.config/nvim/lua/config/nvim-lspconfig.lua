local M = {}

function M.config ()
  local util = require('utils')

  -- https://github.com/neovim/nvim-lspconfig
  local on_attach = function(_) -- param: client
    util.nnoremap('1gD'       , '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    util.nnoremap('<c-]>'     , '<cmd>lua vim.lsp.buf.definition()<CR>')
    util.nnoremap('<C-s>'     , '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    util.nnoremap('K'         , '<cmd>lua vim.lsp.buf.hover()<CR>')
    util.nnoremap('g0'        , '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    util.nnoremap('gi'        , '<cmd>lua vim.lsp.buf.implementation()<CR>')
    util.nnoremap('gW'        , '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    util.nnoremap('gd'        , '<cmd>lua vim.lsp.buf.declaration()<CR>')
    util.nnoremap('gr'        , '<cmd>lua vim.lsp.buf.references()<CR>')
    util.nnoremap('<leader>=' , '<cmd>lua vim.lsp.buf.formatting()<CR>')
    util.nnoremap('<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    util.nnoremap('<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    util.nnoremap('<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    util.nnoremap('<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')

    -- TODO: Move this to treesitter config
    vim.api.nvim_win_set_option(0, 'foldmethod', 'expr')
    vim.api.nvim_win_set_option(0, 'foldexpr', 'nvim_treesitter#foldexpr()')

    print("LSP started.");
  end

  local lsp = require('lspconfig')
  local options = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }

  -- Here's the list of available LSP servers
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  lsp.bashls.setup(options)
  lsp.dockerls.setup(options)
  lsp.gopls.setup(options)
  lsp.html.setup(options)
  lsp.jsonls.setup(options)
  lsp.solargraph.setup(options)
  lsp.vimls.setup(options)
  lsp.terraformls.setup(options)
  lsp.pylsp.setup(options)
  lsp.yamlls.setup(options)

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

  vim.cmd [[
    sign define LspDiagnosticsSignError text=ﱥ texthl=LspDiagnosticsSignError linehl= numhl=
    sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
    sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
    sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
  ]]
end

return M
