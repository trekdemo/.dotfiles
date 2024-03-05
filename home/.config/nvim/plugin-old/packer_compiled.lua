-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gergo/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?.lua;/Users/gergo/.cache/nvim/packer_hererocks/2.1.1703358377/share/lua/5.1/?/init.lua;/Users/gergo/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?.lua;/Users/gergo/.cache/nvim/packer_hererocks/2.1.1703358377/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gergo/.cache/nvim/packer_hererocks/2.1.1703358377/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\n\15\0\1\2\0\0\0\2:\1\1\0L\1\2\0•\1\0\0\16\6\2\2\30-\0\0\0+\2\0\0-\3\1\0)\5\1\0004\6\3\0-\a\2\0'\t\0\0B\a\2\2>\a\1\6-\a\0\0+\t\0\0004\n\4\0-\v\2\0005\r\1\0B\v\2\2>\v\1\n-\v\3\0)\r\1\0B\v\2\2>\v\2\n-\v\4\0)\r\2\0-\14\5\0004\15\0\0B\v\4\0?\v\0\0B\a\3\0?\a\1\0B\3\3\0C\0\1\0\2¿\6¿\3¿\4¿\a¿\18Ä\1\3\0\0\5\f\t\\item \5\aÄÄ¿ô\4\5ÄÄ¿ô\4m\0\3\r\0\6\0\0186\3\0\0009\3\1\3\18\5\2\0'\6\2\0B\3\3\0024\4\0\0\18\a\3\0009\5\3\3B\5\2\4X\b\5Ä6\t\4\0009\t\5\t\18\v\4\0\18\f\b\0B\t\3\1E\b\3\2R\b˘\127L\4\2\0\vinsert\ntable\nlines\6r\npopen\aioP\0\3\r\2\3\0\r\f\3\2\0X\3\1Ä'\3\0\0-\4\0\0+\6\0\0-\a\1\0)\t\1\0006\n\1\0009\n\2\n\18\f\3\0B\n\2\0A\a\1\0C\4\1\0\2¿\4¿\tdate\aos\r%Y-%m-%dˇ\v\1\0\31\0.\4é\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0006\b\0\0'\n\t\0B\b\2\0029\b\n\b6\t\0\0'\v\t\0B\t\2\0029\t\v\t6\n\0\0'\f\t\0B\n\2\0029\n\f\n6\v\0\0'\r\t\0B\v\2\0029\v\r\v6\f\0\0'\14\t\0B\f\2\0029\f\14\f6\r\0\0'\15\t\0B\r\2\0029\r\15\r6\14\0\0'\16\16\0B\14\2\0029\14\17\0146\15\0\0'\17\16\0B\15\2\0029\15\18\0156\16\0\0'\18\19\0B\16\2\0029\17\20\0009\17\21\0175\19\22\0B\17\2\0013\17\23\0+\18\0\0003\18\24\0003\19\25\0003\20\26\0004\21\0\0004\22\4\0\18\23\1\0005\25\28\0004\26\3\0\18\27\3\0'\29\29\0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0'\30\30\0B\27\3\0?\27\0\0B\23\3\2>\23\1\22\18\23\1\0005\25\31\0004\26\3\0\18\27\3\0'\29 \0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0'\30\30\0B\27\3\0?\27\0\0B\23\3\2>\23\2\22\18\23\1\0005\25!\0004\26\3\0\18\27\3\0'\29\"\0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0'\30\30\0B\27\3\0?\27\0\0B\23\3\0?\23\1\0=\22\27\0214\22\3\0\18\23\1\0005\25$\0004\26\a\0\18\27\3\0005\29%\0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0B\27\2\2>\27\2\26\18\27\3\0005\29&\0B\27\2\2>\27\3\26\18\27\4\0)\29\2\0B\27\2\2>\27\4\26\18\27\3\0005\29'\0B\27\2\2>\27\5\26\18\27\4\0)\29\0\0B\27\2\0?\27\2\0B\23\3\0?\23\3\0=\22#\21=\21(\0006\22\0\0'\24)\0B\22\2\0029\22*\22B\22\1\0016\22+\0009\22,\22'\24-\0B\22\2\0012\0\0ÄK\0\1\0æ\2    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'\n    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>\n\n    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>\n    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>\n  \bcmd\bvim\14lazy_load luasnip.loaders.from_vscode\rsnippets\1\4\0\0\5\"## What are you grateful for?\5\1\4\0\0\5!## What drained your energy?\5\1\3\0\0\25## What excited you?\5\1\0\2\tname\20Journaling Cues\ttrig\bWWW\rmarkdown\18attr_writer :\1\0\2\tname\16attr_writer\ttrig\aaw\18attr_reader :\1\0\2\tname\16attr_reader\ttrig\aar\14attribute\20attr_accessor :\1\0\2\tname\18attr_accessor\ttrig\aaa\truby\0\0\0\0\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\23luasnip.util.types\tfmta\bfmt\23luasnip.extras.fmt\19dynamic_lambda\rnonempty\nmatch\fpartial\brep\vlambda\19luasnip.extras\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\5ÄÄ¿ô\4\aÄÄ¿ô\4\rÄÄ¿ô\4\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["animation.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/animation.nvim",
    url = "https://github.com/anuvyklack/animation.nvim"
  },
  ["bash-support.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/bash-support.vim",
    url = "https://github.com/vim-scripts/bash-support.vim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-nvim-lua" },
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-git"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp_luasnip" },
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-path" },
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after = { "nvim-autopairs", "cmp-treesitter" },
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    after = { "cmp-cmdline" },
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    after = { "cmp-buffer" },
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dash.nvim"] = {
    config = { "\27LJ\2\nD\0\0\6\0\4\0\n+\0\1\0'\1\0\0006\2\1\0'\4\2\0B\2\2\0029\2\3\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vsearch\tdash\frequire\5¯\1\1\0\5\0\16\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0003\4\15\0B\0\4\1K\0\1\0\0\n<C-h>\6n\bset\vkeymap\bvim\23file_type_keywords\1\0\0\15typescript\1\5\0\0\15typescript\15javascript\vnodejs\fexpress\15javascript\1\0\0\1\4\0\0\15javascript\vnodejs\fexpress\nsetup\tdash\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/dash.nvim",
    url = "https://github.com/mrjones2014/dash.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0¿\1\0\1\fpreview\2\14prev_hunk3\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0¿\1\0\1\fpreview\2\14next_hunk©\2\1\0\b\0\19\0\0316\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0005\4\5\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5=\5\6\4=\4\b\3B\1\2\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0003\5\14\0005\6\15\0B\1\5\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\16\0003\5\17\0005\6\18\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\tdesc\23:Gitsign prev_hunk\0\a]g\1\0\1\tdesc\23:Gitsign next_hunk\0\a[g\6n\bset\vkeymap\bvim\19preview_config\1\0\2\nnumhl\2\15signcolumn\2\vborder\1\0\0\tthin\16geri.border\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nì\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\3\0\0\thelp\rmarkdown\1\0\6#show_trailing_blankline_indent\1\28show_first_indent_level\1\25show_current_context\2\24max_indent_increase\3\1\19use_treesitter\2\tchar\b‚îÇ\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nå\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\a\3=\3\b\2B\0\2\1K\0\1\0\17handler_opts\vborder\1\0\0\tthin\16geri.border\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["melange-nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/melange-nvim",
    url = "https://github.com/savq/melange-nvim"
  },
  ["mermaid.vim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/mermaid.vim",
    url = "https://github.com/mracos/mermaid.vim"
  },
  middleclass = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/middleclass",
    url = "https://github.com/anuvyklack/middleclass"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["no-neck-pain.nvim"] = {
    config = { "\27LJ\2\nO\0\0\3\1\4\0\b6\0\0\0009\0\1\0'\2\2\0B\0\2\1-\0\0\0009\0\3\0B\0\1\1K\0\1\0\0¿\vtoggle\27WindowsToggleAutowidth\bcmd\bvimÜ\1\1\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\14<leader>n\6n\bset\vkeymap\bvim\1\0\1\nwidth\3å\1\nsetup\17no-neck-pain\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/no-neck-pain.nvim",
    url = "https://github.com/shortcuts/no-neck-pain.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nÛ\2\0\0\a\0\19\0-6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0006\4\0\0'\6\3\0B\4\2\2=\4\5\0034\4\t\0009\5\6\0009\5\a\0059\5\b\5>\5\1\0049\5\6\0009\5\t\0059\5\n\5>\5\2\0049\5\6\0009\5\a\0059\5\v\5>\5\3\0049\5\6\0009\5\a\0059\5\f\5>\5\4\0049\5\6\0009\5\r\0059\5\14\5>\5\5\0049\5\6\0009\5\r\0059\5\15\5>\5\6\0049\5\6\0009\5\a\0059\5\16\5>\5\a\0049\5\6\0009\5\r\0059\5\17\5>\5\b\4=\4\18\3B\1\2\1K\0\1\0\fsources\rprettier\rhadolint\nshfmt\16shellharden\15formatting\15shellcheck\15actionlint\15dictionary\nhover\frubocop\16diagnostics\rbuiltins\14on_attach\1\0\0\30geri.config.lsp-on-attach\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nê\2\0\0\t\0\15\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0026\1\0\0'\3\a\0B\1\2\0029\1\b\1\18\3\1\0009\1\t\1'\4\n\0009\5\v\0005\a\r\0005\b\f\0=\b\14\aB\5\2\0A\1\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\nY\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fpreview\1\0\0\1\0\1\17auto_preview\1\nsetup\bbqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_signature.nvim" },
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0056\0\0\0'\2\1\0B\0\2\2B\0\1\1K\0\1\0\31geri/config/nvim-lspconfig\6R\0" },
    loaded = true,
    only_config = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tmux-navigation"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/nvim-tmux-navigation",
    url = "https://github.com/alexghergh/nvim-tmux-navigation"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    config = { "\27LJ\2\n_\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0 <Cmd>TSPlaygroundToggle<CR>\15<leader>tp\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\nÖ\1\0\0\6\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0B\1\4\1K\0\1\0\20select_refactor\15<leader>rr\6v\bset\vkeymap\bvim\nsetup\16refactoring\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim"
  },
  ["spellrotate.vim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/spellrotate.vim",
    url = "https://github.com/tweekmonster/spellrotate.vim"
  },
  tabular = {
    after_files = { "/Users/gergo/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope-rtp"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/telescope-rtp",
    url = "https://github.com/jeetsukumaran/telescope-rtp"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nä\1\0\0\5\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>ft\6n\bset\vkeymap\bvim\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n0\0\1\4\0\3\0\0056\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\17startinsert!\bcmd\bvim0\0\1\4\0\3\0\0056\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\17startinsert!\bcmd\bvim0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17startinsert!\bcmd\bvim0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17startinsert!\bcmd\bvim¿\1\0\0\5\2\b\1\0246\0\0\0009\0\1\0009\0\2\0-\2\0\0B\0\2\2\t\0\0\0X\0\bÄ-\0\1\0\n\0\0\0X\0\5Ä-\0\1\0\18\2\0\0009\0\3\0B\0\2\1X\0\bÄ6\0\0\0009\0\4\0'\2\5\0-\3\0\0'\4\6\0&\2\4\2'\3\a\0B\0\3\1K\0\1\0\1¿\2Ä\nerror\30. Ensure it is installed.\24Command not found: \vnotify\vtoggle\15executable\afn\bvim\2⁄\1\1\2\t\0\14\1\24+\2\0\0006\3\0\0009\3\1\0039\3\2\3\18\5\1\0B\3\2\2\t\3\0\0X\3\rÄ9\3\3\0\18\6\3\0009\4\4\0035\a\5\0=\1\6\a5\b\a\0=\b\b\a3\b\t\0=\b\n\a3\b\v\0=\b\f\aB\4\3\2\18\2\4\0003\3\r\0002\0\0ÄL\3\2\0\0\ron_close\0\fon_open\0\15float_opts\1\0\1\vborder\vdouble\bcmd\1\0\2\bdir\fgit_dir\14direction\nfloat\bnew\rTerminal\15executable\afn\bvim\2ù\4\1\0\b\0\29\0.6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\0023\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0013\0\n\0006\1\0\0'\3\v\0B\1\2\0026\2\f\0005\3\15\0\18\4\0\0\18\6\1\0'\a\14\0B\4\3\2=\4\16\3\18\4\0\0\18\6\1\0'\a\17\0B\4\3\2=\4\18\3=\3\r\0026\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\23\0'\6\24\0005\a\25\0B\2\5\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\26\0'\6\27\0005\a\28\0B\2\5\1K\0\1\0\1\0\1\tdesc\17open lazygit#<CMD>lua term.nnn_toggle()<CR>\15<leader>nn\1\0\1\tdesc\17open lazygit'<CMD>lua term.lazygit_toggle()<CR>\15<leader>gg\6n\bset\vkeymap\bvim\15nnn_toggle\bnnn\19lazygit_toggle\1\0\0\flazygit\tterm\a_G\24toggleterm.terminal\0\15float_opts\1\0\2\rwinblend\3\6\vborder\vcurved\ron_close\0\fon_open\0\1\0\3\17open_mapping\n<c-t>\14direction\15horizontal\tsize\3\25\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n˙\1\0\0\6\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\27<cmd>TroubleToggle<cr>\15<leader>xx\6n\bset\vkeymap\bvim\16action_keys\15open_split\1\0\0\1\2\0\0\n<c-s>\1\0\2\tmode\25document_diagnostics\fpadding\1\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["ts-node-action"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/ts-node-action",
    url = "https://github.com/ckolkey/ts-node-action"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\nÂ\1\0\0\a\0\15\0\0196\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0005\6\b\0B\1\5\0019\1\t\0005\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\3B\1\2\1K\0\1\0\vexpand\1\4\0\0\rfunction\vmethod\ntable\fdimming\1\0\0\1\0\1\nalpha\4ö≥ÊÃ\tô≥Ê˛\3\nsetup\1\0\1\tdesc\20Toggle Twilight\vtoggle\15<leader>tw\6n\bset\vkeymap\bvim\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nV\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\24:UndotreeToggle<cr>\14<leader>u\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-blockle"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-blockle",
    url = "https://github.com/jgdavey/vim-blockle"
  },
  ["vim-bundler"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-bundler",
    url = "https://github.com/tpope/vim-bundler"
  },
  ["vim-chruby"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-chruby",
    url = "https://github.com/mikepjb/vim-chruby"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\nÿ\1\0\0\5\0\v\0\0296\0\0\0009\0\1\0009\0\2\0005\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0005\2\6\0'\3\4\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0005\2\b\0'\3\t\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0005\2\n\0'\3\t\0'\4\a\0B\0\4\1K\0\1\0\1\2\0\0\6i\n<C-/>\1\3\0\0\6n\6v\26<Esc>:Commentary<CR>A\1\2\0\0\6i\20:Commentary<CR>\n<M-/>\1\3\0\0\6n\6v\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    config = { "\27LJ\2\nƒ\1\0\0\5\0\n\0\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\19:Start tig<CR>\a'g\27:Start rails-mycli<CR>\a'm):Start bundle exec rails console<CR>\a'r\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-helm"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-helm",
    url = "https://github.com/towolf/vim-helm"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\nê\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0+hi link IlluminatedWordRead cursorline\bcmd\bvim\1\0\1\17under_cursor\1\14configure\15illuminate\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-ragtag",
    url = "https://github.com/tpope/vim-ragtag"
  },
  ["vim-rails"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-tmux"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-tmux",
    url = "https://github.com/tmux-plugins/vim-tmux"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-yardoc"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-yardoc",
    url = "https://github.com/noprompt/vim-yardoc"
  },
  vimux = {
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/benmills/vimux"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["windows.nvim"] = {
    config = { "\27LJ\2\n•\2\0\0\5\0\19\0\0286\0\0\0009\0\1\0)\1\n\0=\1\2\0006\0\0\0009\0\1\0)\1\n\0=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\f\0005\3\b\0005\4\a\0=\4\t\0035\4\n\0=\4\v\3=\3\r\2B\0\2\0016\0\0\0009\0\14\0009\0\15\0'\2\16\0'\3\17\0'\4\18\0B\0\4\1K\0\1\0\29<Cmd>WindowsMaximize<CR>\14<A-Enter>\6n\bset\vkeymap\vignore\1\0\0\rfiletype\1\3\0\0\20Neotest Summary\18fugitiveblame\fbuftype\1\0\0\1\2\0\0\rquickfix\nsetup\fwindows\frequire\16winminwidth\rwinwidth\6o\bvim\0" },
    loaded = true,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/start/windows.nvim",
    url = "https://github.com/anuvyklack/windows.nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\2\nﬁ\2\0\0\5\0\22\0\0266\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0009\0\18\0'\2\19\0'\3\20\0'\4\21\0B\0\4\1K\0\1\0\17:ZenMode<CR>\14<leader>z\6n\bset\vkeymap\bvim\fplugins\nkitty\1\0\2\fenabled\2\tfont\a+1\rgitsigns\1\0\1\fenabled\1\rtwilight\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\foptions\1\0\3\15cursorline\2\19relativenumber\2\vnumber\2\1\0\3\nwidth\3d\vheight\4Õô≥Ê\fÃô≥ˇ\3\rbackdrop\3\1\nsetup\rzen-mode\frequire\0" },
    keys = { { "", "<leader>z" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/gergo/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n\15\0\1\2\0\0\0\2:\1\1\0L\1\2\0•\1\0\0\16\6\2\2\30-\0\0\0+\2\0\0-\3\1\0)\5\1\0004\6\3\0-\a\2\0'\t\0\0B\a\2\2>\a\1\6-\a\0\0+\t\0\0004\n\4\0-\v\2\0005\r\1\0B\v\2\2>\v\1\n-\v\3\0)\r\1\0B\v\2\2>\v\2\n-\v\4\0)\r\2\0-\14\5\0004\15\0\0B\v\4\0?\v\0\0B\a\3\0?\a\1\0B\3\3\0C\0\1\0\2¿\6¿\3¿\4¿\a¿\18Ä\1\3\0\0\5\f\t\\item \5\aÄÄ¿ô\4\5ÄÄ¿ô\4m\0\3\r\0\6\0\0186\3\0\0009\3\1\3\18\5\2\0'\6\2\0B\3\3\0024\4\0\0\18\a\3\0009\5\3\3B\5\2\4X\b\5Ä6\t\4\0009\t\5\t\18\v\4\0\18\f\b\0B\t\3\1E\b\3\2R\b˘\127L\4\2\0\vinsert\ntable\nlines\6r\npopen\aioP\0\3\r\2\3\0\r\f\3\2\0X\3\1Ä'\3\0\0-\4\0\0+\6\0\0-\a\1\0)\t\1\0006\n\1\0009\n\2\n\18\f\3\0B\n\2\0A\a\1\0C\4\1\0\2¿\4¿\tdate\aos\r%Y-%m-%dˇ\v\1\0\31\0.\4é\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0006\b\0\0'\n\t\0B\b\2\0029\b\n\b6\t\0\0'\v\t\0B\t\2\0029\t\v\t6\n\0\0'\f\t\0B\n\2\0029\n\f\n6\v\0\0'\r\t\0B\v\2\0029\v\r\v6\f\0\0'\14\t\0B\f\2\0029\f\14\f6\r\0\0'\15\t\0B\r\2\0029\r\15\r6\14\0\0'\16\16\0B\14\2\0029\14\17\0146\15\0\0'\17\16\0B\15\2\0029\15\18\0156\16\0\0'\18\19\0B\16\2\0029\17\20\0009\17\21\0175\19\22\0B\17\2\0013\17\23\0+\18\0\0003\18\24\0003\19\25\0003\20\26\0004\21\0\0004\22\4\0\18\23\1\0005\25\28\0004\26\3\0\18\27\3\0'\29\29\0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0'\30\30\0B\27\3\0?\27\0\0B\23\3\2>\23\1\22\18\23\1\0005\25\31\0004\26\3\0\18\27\3\0'\29 \0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0'\30\30\0B\27\3\0?\27\0\0B\23\3\2>\23\2\22\18\23\1\0005\25!\0004\26\3\0\18\27\3\0'\29\"\0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0'\30\30\0B\27\3\0?\27\0\0B\23\3\0?\23\1\0=\22\27\0214\22\3\0\18\23\1\0005\25$\0004\26\a\0\18\27\3\0005\29%\0B\27\2\2>\27\1\26\18\27\4\0)\29\1\0B\27\2\2>\27\2\26\18\27\3\0005\29&\0B\27\2\2>\27\3\26\18\27\4\0)\29\2\0B\27\2\2>\27\4\26\18\27\3\0005\29'\0B\27\2\2>\27\5\26\18\27\4\0)\29\0\0B\27\2\0?\27\2\0B\23\3\0?\23\3\0=\22#\21=\21(\0006\22\0\0'\24)\0B\22\2\0029\22*\22B\22\1\0016\22+\0009\22,\22'\24-\0B\22\2\0012\0\0ÄK\0\1\0æ\2    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'\n    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>\n\n    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>\n    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>\n  \bcmd\bvim\14lazy_load luasnip.loaders.from_vscode\rsnippets\1\4\0\0\5\"## What are you grateful for?\5\1\4\0\0\5!## What drained your energy?\5\1\3\0\0\25## What excited you?\5\1\0\2\tname\20Journaling Cues\ttrig\bWWW\rmarkdown\18attr_writer :\1\0\2\tname\16attr_writer\ttrig\aaw\18attr_reader :\1\0\2\tname\16attr_reader\ttrig\aar\14attribute\20attr_accessor :\1\0\2\tname\18attr_accessor\ttrig\aaa\truby\0\0\0\0\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\23luasnip.util.types\tfmta\bfmt\23luasnip.extras.fmt\19dynamic_lambda\rnonempty\nmatch\fpartial\brep\vlambda\19luasnip.extras\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\5ÄÄ¿ô\4\aÄÄ¿ô\4\rÄÄ¿ô\4\3ÄÄ¿ô\4\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n0\0\1\4\0\3\0\0056\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\17startinsert!\bcmd\bvim0\0\1\4\0\3\0\0056\1\0\0009\1\1\1'\3\2\0B\1\2\1K\0\1\0\17startinsert!\bcmd\bvim0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17startinsert!\bcmd\bvim0\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\17startinsert!\bcmd\bvim¿\1\0\0\5\2\b\1\0246\0\0\0009\0\1\0009\0\2\0-\2\0\0B\0\2\2\t\0\0\0X\0\bÄ-\0\1\0\n\0\0\0X\0\5Ä-\0\1\0\18\2\0\0009\0\3\0B\0\2\1X\0\bÄ6\0\0\0009\0\4\0'\2\5\0-\3\0\0'\4\6\0&\2\4\2'\3\a\0B\0\3\1K\0\1\0\1¿\2Ä\nerror\30. Ensure it is installed.\24Command not found: \vnotify\vtoggle\15executable\afn\bvim\2⁄\1\1\2\t\0\14\1\24+\2\0\0006\3\0\0009\3\1\0039\3\2\3\18\5\1\0B\3\2\2\t\3\0\0X\3\rÄ9\3\3\0\18\6\3\0009\4\4\0035\a\5\0=\1\6\a5\b\a\0=\b\b\a3\b\t\0=\b\n\a3\b\v\0=\b\f\aB\4\3\2\18\2\4\0003\3\r\0002\0\0ÄL\3\2\0\0\ron_close\0\fon_open\0\15float_opts\1\0\1\vborder\vdouble\bcmd\1\0\2\bdir\fgit_dir\14direction\nfloat\bnew\rTerminal\15executable\afn\bvim\2ù\4\1\0\b\0\29\0.6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\0023\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0013\0\n\0006\1\0\0'\3\v\0B\1\2\0026\2\f\0005\3\15\0\18\4\0\0\18\6\1\0'\a\14\0B\4\3\2=\4\16\3\18\4\0\0\18\6\1\0'\a\17\0B\4\3\2=\4\18\3=\3\r\0026\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\23\0'\6\24\0005\a\25\0B\2\5\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\26\0'\6\27\0005\a\28\0B\2\5\1K\0\1\0\1\0\1\tdesc\17open lazygit#<CMD>lua term.nnn_toggle()<CR>\15<leader>nn\1\0\1\tdesc\17open lazygit'<CMD>lua term.lazygit_toggle()<CR>\15<leader>gg\6n\bset\vkeymap\bvim\15nnn_toggle\bnnn\19lazygit_toggle\1\0\0\flazygit\tterm\a_G\24toggleterm.terminal\0\15float_opts\1\0\2\rwinblend\3\6\vborder\vcurved\ron_close\0\fon_open\0\1\0\3\17open_mapping\n<c-t>\14direction\15horizontal\tsize\3\25\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\nV\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\24:UndotreeToggle<cr>\14<leader>u\6n\bset\vkeymap\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: refactoring.nvim
time([[Config for refactoring.nvim]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\6\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0009\5\b\0B\1\4\1K\0\1\0\20select_refactor\15<leader>rr\6v\bset\vkeymap\bvim\nsetup\16refactoring\frequire\0", "config", "refactoring.nvim")
time([[Config for refactoring.nvim]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\nê\1\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0+hi link IlluminatedWordRead cursorline\bcmd\bvim\1\0\1\17under_cursor\1\14configure\15illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\nÂ\1\0\0\a\0\15\0\0196\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0009\5\a\0005\6\b\0B\1\5\0019\1\t\0005\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\3B\1\2\1K\0\1\0\vexpand\1\4\0\0\rfunction\vmethod\ntable\fdimming\1\0\0\1\0\1\nalpha\4ö≥ÊÃ\tô≥Ê˛\3\nsetup\1\0\1\tdesc\20Toggle Twilight\vtoggle\15<leader>tw\6n\bset\vkeymap\bvim\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nÛ\2\0\0\a\0\19\0-6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0006\4\0\0'\6\3\0B\4\2\2=\4\5\0034\4\t\0009\5\6\0009\5\a\0059\5\b\5>\5\1\0049\5\6\0009\5\t\0059\5\n\5>\5\2\0049\5\6\0009\5\a\0059\5\v\5>\5\3\0049\5\6\0009\5\a\0059\5\f\5>\5\4\0049\5\6\0009\5\r\0059\5\14\5>\5\5\0049\5\6\0009\5\r\0059\5\15\5>\5\6\0049\5\6\0009\5\a\0059\5\16\5>\5\a\0049\5\6\0009\5\r\0059\5\17\5>\5\b\4=\4\18\3B\1\2\1K\0\1\0\fsources\rprettier\rhadolint\nshfmt\16shellharden\15formatting\15shellcheck\15actionlint\15dictionary\nhover\frubocop\16diagnostics\rbuiltins\14on_attach\1\0\0\30geri.config.lsp-on-attach\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nì\2\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\3\0\0\thelp\rmarkdown\1\0\6#show_trailing_blankline_indent\1\28show_first_indent_level\1\25show_current_context\2\24max_indent_increase\3\1\19use_treesitter\2\tchar\b‚îÇ\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: no-neck-pain.nvim
time([[Config for no-neck-pain.nvim]], true)
try_loadstring("\27LJ\2\nO\0\0\3\1\4\0\b6\0\0\0009\0\1\0'\2\2\0B\0\2\1-\0\0\0009\0\3\0B\0\1\1K\0\1\0\0¿\vtoggle\27WindowsToggleAutowidth\bcmd\bvimÜ\1\1\0\6\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\14<leader>n\6n\bset\vkeymap\bvim\1\0\1\nwidth\3å\1\nsetup\17no-neck-pain\frequire\0", "config", "no-neck-pain.nvim")
time([[Config for no-neck-pain.nvim]], false)
-- Config for: playground
time([[Config for playground]], true)
try_loadstring("\27LJ\2\n_\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0 <Cmd>TSPlaygroundToggle<CR>\15<leader>tp\6n\bset\vkeymap\bvim\0", "config", "playground")
time([[Config for playground]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nä\1\0\0\5\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\1K\0\1\0\23:TodoTelescope<CR>\15<leader>ft\6n\bset\vkeymap\bvim\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0¿\1\0\1\fpreview\2\14prev_hunk3\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0¿\1\0\1\fpreview\2\14next_hunk©\2\1\0\b\0\19\0\0316\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\a\0005\4\5\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5=\5\6\4=\4\b\3B\1\2\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\r\0003\5\14\0005\6\15\0B\1\5\0016\1\t\0009\1\n\0019\1\v\1'\3\f\0'\4\16\0003\5\17\0005\6\18\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\tdesc\23:Gitsign prev_hunk\0\a]g\1\0\1\tdesc\23:Gitsign next_hunk\0\a[g\6n\bset\vkeymap\bvim\19preview_config\1\0\2\nnumhl\2\15signcolumn\2\vborder\1\0\0\tthin\16geri.border\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-dispatch
time([[Config for vim-dispatch]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\5\0\n\0\0226\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\b\0'\4\t\0B\0\4\1K\0\1\0\19:Start tig<CR>\a'g\27:Start rails-mycli<CR>\a'm):Start bundle exec rails console<CR>\a'r\6n\bset\vkeymap\bvim\0", "config", "vim-dispatch")
time([[Config for vim-dispatch]], false)
-- Config for: dash.nvim
time([[Config for dash.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\6\0\4\0\n+\0\1\0'\1\0\0006\2\1\0'\4\2\0B\2\2\0029\2\3\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vsearch\tdash\frequire\5¯\1\1\0\5\0\16\0\0206\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0003\4\15\0B\0\4\1K\0\1\0\0\n<C-h>\6n\bset\vkeymap\bvim\23file_type_keywords\1\0\0\15typescript\1\5\0\0\15typescript\15javascript\vnodejs\fexpress\15javascript\1\0\0\1\4\0\0\15javascript\vnodejs\fexpress\nsetup\tdash\frequire\0", "config", "dash.nvim")
time([[Config for dash.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: windows.nvim
time([[Config for windows.nvim]], true)
try_loadstring("\27LJ\2\n•\2\0\0\5\0\19\0\0286\0\0\0009\0\1\0)\1\n\0=\1\2\0006\0\0\0009\0\1\0)\1\n\0=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\f\0005\3\b\0005\4\a\0=\4\t\0035\4\n\0=\4\v\3=\3\r\2B\0\2\0016\0\0\0009\0\14\0009\0\15\0'\2\16\0'\3\17\0'\4\18\0B\0\4\1K\0\1\0\29<Cmd>WindowsMaximize<CR>\14<A-Enter>\6n\bset\vkeymap\vignore\1\0\0\rfiletype\1\3\0\0\20Neotest Summary\18fugitiveblame\fbuftype\1\0\0\1\2\0\0\rquickfix\nsetup\fwindows\frequire\16winminwidth\rwinwidth\6o\bvim\0", "config", "windows.nvim")
time([[Config for windows.nvim]], false)
-- Config for: cmp-git
time([[Config for cmp-git]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcmp_git\frequire\0", "config", "cmp-git")
time([[Config for cmp-git]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0056\0\0\0'\2\1\0B\0\2\2B\0\1\1K\0\1\0\31geri/config/nvim-lspconfig\6R\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n˙\1\0\0\6\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\27<cmd>TroubleToggle<cr>\15<leader>xx\6n\bset\vkeymap\bvim\16action_keys\15open_split\1\0\0\1\2\0\0\n<c-s>\1\0\2\tmode\25document_diagnostics\fpadding\1\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vim-commentary
time([[Config for vim-commentary]], true)
try_loadstring("\27LJ\2\nÿ\1\0\0\5\0\v\0\0296\0\0\0009\0\1\0009\0\2\0005\2\3\0'\3\4\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0005\2\6\0'\3\4\0'\4\a\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0005\2\b\0'\3\t\0'\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0005\2\n\0'\3\t\0'\4\a\0B\0\4\1K\0\1\0\1\2\0\0\6i\n<C-/>\1\3\0\0\6n\6v\26<Esc>:Commentary<CR>A\1\2\0\0\6i\20:Commentary<CR>\n<M-/>\1\3\0\0\6n\6v\bset\vkeymap\bvim\0", "config", "vim-commentary")
time([[Config for vim-commentary]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd lsp_signature.nvim ]]

-- Config for: lsp_signature.nvim
try_loadstring("\27LJ\2\nå\1\0\0\a\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\a\3=\3\b\2B\0\2\1K\0\1\0\17handler_opts\vborder\1\0\0\tthin\16geri.border\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")

vim.cmd [[ packadd lspkind-nvim ]]
vim.cmd [[ packadd nvim-cmp ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-treesitter ]]
vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\nê\2\0\0\t\0\15\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0026\1\0\0'\3\a\0B\1\2\0029\1\b\1\18\3\1\0009\1\t\1'\4\n\0009\5\v\0005\a\r\0005\b\f\0=\b\14\aB\5\2\0A\1\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'ZenMode', function(cmdargs)
          require('packer.load')({'zen-mode.nvim'}, { cmd = 'ZenMode', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'zen-mode.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('ZenMode ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>z <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = "<lt>leader>z", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-chruby', 'vim-bundler', 'vim-blockle', 'vim-yardoc', 'vim-rails'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'bash-support.vim'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'tabular'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'bash-support.vim'}, { ft = "bash" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /Users/gergo/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
