local activateLspFormatting = function()
  local lsp_format_grp = vim.api.nvim_create_augroup("MyLspFormating", {clear = true})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_format_grp,
    buffer = 0,
    callback = vim.lsp.buf.formatting_sync
  })
end

local activateLspReferenceUnderCursor = function ()
  local lsp_ref_grp = vim.api.nvim_create_augroup("MyLspReferenceUnderCursor", {clear = true})
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

local activateDiagnosticFloat = function()
  local grp = vim.api.nvim_create_augroup("MyDiagnosticFloat", {clear = true})
  vim.api.nvim_create_autocmd("CursorHold", {
    group = grp,
    buffer = 0,
    callback = function () vim.diagnostic.open_float({focusable = false}) end
  })
end

return function(client, bufnr)
    require('which-key').register({
      ['g0'] = {'<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'LSP: Document Symbol'},
      ['gD'] = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP: Type Definition'},
      ['gW'] = {'<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 'LSP: Workspace Symbol' },
      -- gr is mapped in telescope.lua
      ['gR'] = {'<cmd>lua vim.lsp.buf.references()<CR>', 'LSP: References'},
      ['gi']      = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: Jump to Definition' },
      ['<C-]>']      = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: Jump to Definition' },
      ['<C-w><C-]>'] = { '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', 'LSP: Jump to Definition (vsplit)' },
      ['<C-s>']      = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'LSP: Signature' },
      ['K']          = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'LSP: Hover' },
      ['<leader>af'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'LSP: Code action' },
      ['<leader>ai'] = { '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', 'LSP: Incoming calls' },
      ['<leader>ao'] = { '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', 'LSP: Outgoing calls' },
      ['<leader>ar'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'LSP: Rename' },
      ['<leader>dl'] = { '<cmd>lua vim.diagnostic.set_loclist()<CR>', 'Diagnostics - Set loclist' },
      ['[d']         = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Diagonstics: Previous' },
      [']d']         = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Diagnostics: Next' },
    }, { noremap = true, buffer = bufnr })

    activateDiagnosticFloat()
    if client.resolved_capabilities.document_formatting then
      activateLspFormatting()
    end
    if client.resolved_capabilities.document_highlight then
      activateLspReferenceUnderCursor()
    end


    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- TODO: Move this to treesitter config
    vim.api.nvim_win_set_option(0, 'foldmethod', 'expr')
    vim.api.nvim_win_set_option(0, 'foldexpr', 'nvim_treesitter#foldexpr()')

    print("LSP client started (" .. client.name .. ")");
  end
