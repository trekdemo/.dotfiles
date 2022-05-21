vim.cmd [[
let test#strategy = 'dispatch'
let test#ruby#rspec#options = '--format progress'
]]

require('which-key').register({
  ['<leader>'] = {
    t = {
      name = '+test',
      l = {'<cmd>TestLast<cr>', 'Re-run test'},
      a = {'<cmd>AbortDispatch<cr>', 'Abort dispatch'},

      n = {'<cmd>TestNearest<cr>', 'Test nearest'},
      f = {'<cmd>TestFile<cr>', 'Test current file'},
      s = {'<cmd>TestSuite<cr>', 'Test suite'},
    }
  },
}, {silent = true})
