return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'kosayoda/nvim-lightbulb', event = 'LspAttach', opts = { autocmd = { enabled = true } } },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- NOTE: Remember that lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself
        -- many times.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        -- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Rename the variable under your cursor
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end

        if client and client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
        end
      end,
    })

    -- Enable the following language servers
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
    vim.lsp.enable 'ruby_lsp' -- gem install ruby-lsp
    vim.lsp.enable 'herb_ls' -- npm install -g @herb-tools/language-server
  end,
}
