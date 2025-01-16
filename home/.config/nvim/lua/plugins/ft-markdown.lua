return {
  { 'mracos/mermaid.vim', ft = { 'markdown', 'mermaid' } },
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
