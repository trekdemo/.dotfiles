local M = {}

M.config = function ()
  local ls = require("luasnip")

  -- Shorthands...
  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local l = require("luasnip.extras").lambda
  local r = require("luasnip.extras").rep
  local p = require("luasnip.extras").partial
  local m = require("luasnip.extras").match
  local n = require("luasnip.extras").nonempty
  local dl = require("luasnip.extras").dynamic_lambda
  local fmt = require("luasnip.extras.fmt").fmt
  local fmta = require("luasnip.extras.fmt").fmta
  local types = require("luasnip.util.types")

  -- Every unspecified option will be set to the default.
  ls.config.set_config({
    history = true,
    -- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",
    -- ext_opts = {
    --   [types.choiceNode] = {
    --     active = {
    --       virt_text = { { "choiceNode", "Comment" } },
    --     },
    --   },
    -- },
  })

  -- args is a table, where 1 is the text in Placeholder 1, 2 the text in
  -- placeholder 2,...
  local function copy(args)
    return args[1]
  end

  -- 'recursive' dynamic snippet. Expands to some text followed by itself.
  local rec_ls
  rec_ls = function()
    return sn(
      nil,
      c(1, {
        -- Order is important, sn(...) first would cause infinite loop of expansion.
        t(""),
        sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
      })
    )
  end

  -- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
  local function bash(_, _, command)
    local file = io.popen(command, "r")
    local res = {}
    for line in file:lines() do
      table.insert(res, line)
    end
    return res
  end

  -- Returns a snippet_node wrapped around an insert_node whose initial
  -- text value is set to the current date in the desired format.
  local date_input = function(args, state, fmt)
    local fmt = fmt or "%Y-%m-%d"
    return sn(nil, i(1, os.date(fmt)))
  end

  -- When trying to expand a snippet, luasnip first searches the tables for
  -- each filetype specified in 'filetype' followed by 'all'.
  -- If ie. the filetype is 'lua.c'
  --     - luasnip.lua
  --     - luasnip.c
  --     - luasnip.all
  -- are searched in that order.
  -- Examples:
  -- https://github.com/L3MON4D3/LuaSnip/blob/3dc04d379f82b7263b26565c74748ea68879b022/Examples/snippets.lua#L160
  local snippets = {}
  snippets.ruby = {
    s({trig = 'aa', name = 'attr_accessor'}, {
      t('attr_accessor :'), i(1, "attribute")
    }),
    s({trig = 'ar', name = 'attr_reader'}, {
      t('attr_reader :'), i(1, "attribute")
    }),
    s({trig = 'aw', name = 'attr_writer'}, {
      t('attr_writer :'), i(1, "attribute")
    }),
  }
  snippets.markdown = {
    s({trig = 'WWW', name = 'Journaling Cues'}, {
      t({"## What excited you?", ""}),
      i(1),
      t({"", "## What drained your energy?", ""}),
      i(2),
      t({"", "## What are you grateful for?", ""}),
      i(0),
    }),
  }
  ls.snippets = snippets

  -- Loads snippets from https://github.com/rafamadriz/friendly-snippets
  -- The plugin is installed using the plugin manager
  require("luasnip.loaders.from_vscode").lazy_load()

  -- Mappings
  vim.cmd [[
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
  ]]
end

return M
