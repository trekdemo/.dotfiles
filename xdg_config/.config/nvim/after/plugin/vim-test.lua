vim.cmd [[
let test#strategy = 'dispatch'
let test#ruby#rspec#options = '--format progress'
]]

require('which-key').register({
  ['<leader>'] = {
    t = {
      name = '+test',
      l = {'<cmd>TestLast<cr>', 'Run last test'},

      n = {'<cmd>TestNearest<cr>', 'Run the nearest test'},
      f = {'<cmd>TestFile<cr>', 'Run test for the current file'},
      s = {'<cmd>TestSuite<cr>', 'Run test of the project'},

      N = {'<cmd>TestNearest -strategy=vimux<cr>', 'Run the nearest test in tmux'},
      F = {'<cmd>TestFile -strategy=vimux<cr>', 'Run test for the current file in tmux'},
      S = {'<cmd>TestSuite -strategy=vimux<cr>', 'Run test of the project in tmux'},
    }
  },
}, {silent = true})
