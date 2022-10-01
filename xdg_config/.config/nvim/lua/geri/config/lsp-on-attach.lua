local activateLspFormatting = function(bufnr)
  local lsp_format_grp = vim.api.nvim_create_augroup("MyLspFormating", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_format_grp,
    buffer = bufnr,
    callback = vim.lsp.buf.formatting_sync
  })
end

local activateLspReferenceUnderCursor = function(bufnr)
  local lsp_ref_grp = vim.api.nvim_create_augroup("MyLspReferenceUnderCursor", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    group = lsp_ref_grp,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = lsp_ref_grp,
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })
end

return function(client, bufnr)
  local telescope = require('telescope.builtin')
  local lsp_buf = vim.lsp.buf

  vim.keymap.set('n', 'K', lsp_buf.hover, { desc = 'LSP: Hover' })
  vim.keymap.set('n', 'gr', telescope.lsp_references, { desc = "Telescope lsp_reference" })
  vim.keymap.set('n', 'gi', telescope.lsp_definitions, { desc = 'LSP: Definitions' })
  vim.keymap.set('n', 'gI', function() telescope.lsp_definitions({ jump_type = 'vsplit' }) end,
    { desc = 'LSP: Definitions' })
  vim.keymap.set('n', 'gd', telescope.lsp_type_definitions, { desc = 'LSP: Type Definitions' })
  vim.keymap.set('n', '<leader>ca', lsp_buf.code_action, { desc = 'LSP: List code actions' })
  vim.keymap.set('n', '<leader>cI', lsp_buf.incoming_calls, { desc = 'LSP: Incoming calls' })
  vim.keymap.set('n', '<leader>cO', lsp_buf.outgoing_calls, { desc = 'LSP: Outgoing calls' })
  vim.keymap.set('n', '<leader>cr', lsp_buf.rename, { desc = 'LSP: Rename' })

  if client.server_capabilities.document_formatting then
    activateLspFormatting(bufnr)
  end
  if client.server_capabilities.document_highlight then
    activateLspReferenceUnderCursor(bufnr)
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end
