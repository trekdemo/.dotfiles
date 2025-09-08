return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'kosayoda/nvim-lightbulb', opts = { autocmd = { enabled = true } } },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  opts = {
    capabilities = {
      workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      },
    },
  },
  config = function(_, opts)
    vim.lsp.config('*', opts)

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold' }, {
            buffer = args.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
            buffer = args.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end

        -- Enable inlay hints
        if client and client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
        end

        -- Enable code lenses
        if client and client.server_capabilities.codeLensProvider then
          vim.lsp.codelens.refresh { bufnr = args.buf }
          vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
            buffer = args.buf,
            callback = vim.lsp.codelens.refresh,
          })
        end
        vim.keymap.set({ 'n', 'v' }, 'grl', vim.lsp.codelens.run, { desc = 'vim.lsp.codelens.run()' })
      end,
    })

    vim.lsp.enable 'gopls'
    vim.lsp.enable 'dockerls'
    vim.lsp.enable 'html'
    vim.lsp.enable 'ts_ls'
    vim.lsp.enable 'jsonls'
    vim.lsp.enable 'yamlls' -- brew install yaml-language-server
    vim.lsp.enable 'tailwindcss'
    vim.lsp.enable 'marksman' -- brew install marksman
    vim.lsp.enable 'codebook'
    vim.lsp.enable 'bashls'
    vim.lsp.enable 'lua_ls'
    -- Do this to debug https://lsp-devtools.readthedocs.io/en/latest/lsp-devtools/guide/getting-started.html
    -- vim.lsp.config('ruby_lsp', { cmd = { 'lsp-devtools', 'agent', '--', 'ruby-lsp' } })
    vim.lsp.enable 'ruby_lsp' -- gem install ruby-lsp ruby-lsp-rails ruby-lsp-rspec
    vim.lsp.enable 'herb_ls' -- npm install -g @herb-tools/language-server
  end,
}
