local M = {}

M.config = function ()
  -- https://github.com/windwp/nvim-autopairs
  require('nvim-autopairs').setup({
    disable_filetype = { 'TelescopePrompt', 'vim' },
  })
  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  require('cmp').event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({ map_char = { tex = '' } })
  )
end

return M