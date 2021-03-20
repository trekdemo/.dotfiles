local vim = vim
local map = function(type, key, value)
  vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

-- https://github.com/neovim/nvim-lspconfig
local custom_attach = function(client)
  print("LSP started.");
  require'completion'.on_attach(client)

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

lsp.bashls.setup { on_attach=custom_attach }
-- lsp.ccls.setup { on_attach=custom_attach }
lsp.dockerls.setup { on_attach=custom_attach }
lsp.gopls.setup { on_attach=custom_attach }
lsp.html.setup { on_attach=custom_attach }
lsp.jsonls.setup { on_attach=custom_attach }
lsp.solargraph.setup { on_attach=custom_attach }
lsp.vimls.setup { on_attach=custom_attach }
lsp.terraformls.setup { on_attach=custom_attach }
lsp.yamlls.setup {
  on_attach=custom_attach,
  settings = {
    yaml = {
      hover = true,
      completion = true,
      validate = false,
    }
  },
}
-- lsp.sumneko_lua.setup {
--   on_attach=custom_attach,
--   settings = {
--     Lua = {
--       runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
--       completion = { keywordSnippet = "Disable", },
--       workspace = {
--         library = {
--           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--           [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--         }
--       }
--     }
--   }
-- }
