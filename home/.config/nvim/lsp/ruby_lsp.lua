-- Install solargraph & rusy-lsp manually for each Ruby version
-- cmd = { 'chruby-exec', '$RUBY_VERSION', '--', 'solargraph', 'stdio' },

return {
  init_options = {
    indexing = {
      includedPatterns = { 'packs/*/**' },
    },
    addonSettings = {
      ['Ruby LSP Rails'] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
