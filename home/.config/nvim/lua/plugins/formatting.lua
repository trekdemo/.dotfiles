return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      eruby = { 'erb-format' },
      -- pip3 install
      --   mdformat-gfm mdformat-frontmatter mdformat-footnote
      --   mdformat-wikilink
      -- markdown = { 'mdformat' },
    },
  },
}