return function(client, bufnr)
    require('which-key').register({
      ['g0'] = {'<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'LSP: Document Symbol'},
      ['gD'] = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'LSP: Type Definition'},
      ['gW'] = {'<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', 'LSP: Workspace Symbol' },
      ['gr'] = {'<cmd>lua vim.lsp.buf.references()<CR>', 'LSP: References'},
      ['<C-]>']      = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'LSP: Jump to Definition' },
      ['<C-w><C-]>'] = { '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>', 'LSP: Jump to Definition (vsplit)' },
      ['<C-s>']      = { '<cmd>lua vim.lsp.buf.signature_help()<CR>' },
      ['K']          = { '<cmd>lua vim.lsp.buf.hover()<CR>' },
      ['<leader>af'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>' },
      ['<leader>ai'] = { '<cmd>lua vim.lsp.buf.incoming_calls()<CR>' },
      ['<leader>ao'] = { '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>' },
      ['<leader>ar'] = { '<cmd>lua vim.lsp.buf.rename()<CR>' },
      ['<leader>dl'] = { '<cmd>lua vim.diagnostic.set_loclist()<CR>' },
      ['[d']         = { '<cmd>lua vim.diagnostic.goto_prev()<CR>' },
      [']d']         = { '<cmd>lua vim.diagnostic.goto_next()<CR>' },
    }, { noremap = true, buffer = bufnr })

    local end_message = "LSP client started (" .. client.name .. "):"
    if client.resolved_capabilities.document_formatting then
      end_message = end_message .. " formatting"

      vim.cmd([[
      augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    -- TODO: Move this to treesitter config
    vim.api.nvim_win_set_option(0, 'foldmethod', 'expr')
    vim.api.nvim_win_set_option(0, 'foldexpr', 'nvim_treesitter#foldexpr()')

    print(end_message);
  end
