local activateLspFormatting = function()
  local lsp_format_grp = vim.api.nvim_create_augroup("MyLspFormating", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_format_grp,
    buffer = 0,
    callback = vim.lsp.buf.formatting_sync
  })
end

local activateLspReferenceUnderCursor = function()
  local lsp_ref_grp = vim.api.nvim_create_augroup("MyLspReferenceUnderCursor", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    group = lsp_ref_grp,
    buffer = 0,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = lsp_ref_grp,
    buffer = 0,
    callback = vim.lsp.buf.clear_references,
  })
end

return function(client, bufnr)
  local builtins = require('telescope.builtin')
  local lsp_buf = vim.lsp.buf

  vim.keymap.set('n', 'g0', lsp_buf.document_symbol, { desc = 'LSP: Document Symbol' })
  vim.keymap.set('n', 'gD', lsp_buf.type_definition, { desc = 'LSP: Type Definition' })
  vim.keymap.set('n', 'gW', lsp_buf.workspace_symbol, { desc = 'LSP: Workspace Symbol' })
  vim.keymap.set('n', 'gr', builtins.lsp_references, { desc = "Telescope lsp_reference" })
  vim.keymap.set('n', 'gR', lsp_buf.references, { desc = 'LSP: References' })
  vim.keymap.set('n', 'gi', lsp_buf.definition, { desc = 'LSP: Jump to Definition' })
  vim.keymap.set('n', 'gI', '<cmd>vsplit | lua lsp_buf.definition()<CR>', { desc = 'LSP: Jump to Definition (vsplit)' })
  vim.keymap.set('n', 'K', lsp_buf.hover, { desc = 'LSP: Hover' })
  vim.keymap.set('n', '<leader>af', lsp_buf.code_action, { desc = 'LSP: Code action' })
  vim.keymap.set('n', '<leader>ai', lsp_buf.incoming_calls, { desc = 'LSP: Incoming calls' })
  vim.keymap.set('n', '<leader>ao', lsp_buf.outgoing_calls, { desc = 'LSP: Outgoing calls' })
  vim.keymap.set('n', '<leader>ar', lsp_buf.rename, { desc = 'LSP: Rename' })

  if client.resolved_capabilities.document_formatting then
    activateLspFormatting()
  end
  if client.resolved_capabilities.document_highlight then
    activateLspReferenceUnderCursor()
  end


  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end
