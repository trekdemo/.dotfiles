return {
  -- https://shopify.github.io/ruby-lsp/#vs-code-features
  init_options = {
    featuresConfiguration = {
      inlayHint = { enableAll = true },
    },
    indexing = {
      includedPatterns = { 'packs/*/**' },
    },
    addonSettings = {
      ['Ruby LSP Rails'] = {
        enablePendingMigrationsPrompt = false,
      },
      -- https://github.com/st0012/ruby-lsp-rspec?tab=readme-ov-file#vs-code-configuration
      ['Ruby LSP RSpec'] = {
        debug = false,
      },
    },
  },
}
