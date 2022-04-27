vim.cmd [[
let test#strategy = 'dispatch'
let test#ruby#rspec#options = '--format progress'
]]

require('which-key').register({
  t = {
    name = '+test',
    ['<C-l>'] = {'<cmd>TestLast<cr>', 'Run last test'},
    ['<C-g>'] = {'<cmd>TestLast<cr>', 'Go to last test'},
    ['l'] = {'<cmd>TestLast<cr>', 'Run last test'},
    ['g'] = {'<cmd>TestLast<cr>', 'Go to last test'},

    ['<C-n>'] = {'<cmd>TestNearest<cr>', 'Test nearest'},
    ['<C-f>'] = {'<cmd>TestFile<cr>', 'Test file'},
    ['<C-s>'] = {'<cmd>TestSuite<cr>', 'Test suite'},
    ['n'] = {'<cmd>TestNearest<cr>', 'Test nearest'},
    ['f'] = {'<cmd>TestFile<cr>', 'Test file'},
    ['s'] = {'<cmd>TestSuite<cr>', 'Test suite'},

    ['<S-n>'] = {'<cmd>TestNearest -strategy=vimux<cr>', 'Test nearest'},
    ['<S-f>'] = {'<cmd>TestFile -strategy=vimux<cr>', 'Test file'},
    ['<S-s>'] = {'<cmd>TestSuite -strategy=vimux<cr>', 'Test ruite'},
  }
}, {silent = true})
