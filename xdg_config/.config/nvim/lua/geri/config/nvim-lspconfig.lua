local M = {}

function M.config ()
  local buf_nnoremap = function (buffer, key, cmd)
    local opts = { silent = true, noremap = true }
    return vim.api.nvim_buf_set_keymap(buffer, 'n', key, cmd, opts)
  end

  -- https://github.com/neovim/nvim-lspconfig
  local on_attach = function(_, bufnr) -- param: client
    buf_nnoremap(bufnr, 'gD'        , '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_nnoremap(bufnr, '<C-]>'     , '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_nnoremap(bufnr, '<C-w>]'    , '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>')
    buf_nnoremap(bufnr, '<C-w><C-]>', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>')
    buf_nnoremap(bufnr, '<C-s>'     , '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_nnoremap(bufnr, 'K'         , '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_nnoremap(bufnr, 'g0'        , '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    buf_nnoremap(bufnr, 'gW'        , '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    buf_nnoremap(bufnr, 'gr'        , '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_nnoremap(bufnr, '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_nnoremap(bufnr, '<leader>ai', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    buf_nnoremap(bufnr, '<leader>ao', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
    buf_nnoremap(bufnr, '<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_nnoremap(bufnr, '<leader>dl', '<cmd>lua vim.diagnostic.set_loclist()<CR>')
    buf_nnoremap(bufnr, '[d'        , '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    buf_nnoremap(bufnr, ']d'        , '<cmd>lua vim.diagnostic.goto_next()<CR>')

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_command [[
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
    ]]

    -- TODO: Move this to treesitter config
    vim.api.nvim_win_set_option(0, 'foldmethod', 'expr')
    vim.api.nvim_win_set_option(0, 'foldexpr', 'nvim_treesitter#foldexpr()')

    print("LSP started.");
  end

  -- Here's the list of available LSP servers
  -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
  local lsp = require('lspconfig')
  local options = {
    on_attach = on_attach,
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
