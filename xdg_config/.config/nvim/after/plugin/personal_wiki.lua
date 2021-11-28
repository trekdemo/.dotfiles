-- Check with  ../../plugin/personal_wiki.lua
--
local vimwiki_config = vim.g.vimwiki_list[1]
local home = vim.fn.expand(vimwiki_config['path'])
local templates = home .. 'templates/'
require('telekasten').setup({
  home         = home,
  dailies      = home .. 'diary',
  weeklies     = home .. 'weekly',
  templates    = templates,
	template_new_note =   home .. "templates/new_note.md",
	template_new_daily =  home .. "templates/daily_tk.md",
	template_new_weekly = home .. "templates/weekly_tk.md",

  -- image subdir for pasting
  -- subdir name
  -- or nil if pasted images shouldn't go into a special subdir
  image_subdir = "img",

  -- markdown file extension
  extension    = vimwiki_config.ext,

  -- image link style
  -- wiki:     ![[image name]]
  -- markdown: ![](image_subdir/xxxxx.png)
  image_link_style = vimwiki_config.syntax,

  -- following a link to a non-existing note will create it
  follow_creates_nonexisting = true,
  dailies_create_nonexisting = true,
  weeklies_create_nonexisting = true,

  -- template for new notes (new_note, follow_link)

  -- integrate with calendar-vim
  plug_into_calendar = true,
  calendar_opts = {
    -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
    weeknm = 2,
    -- use monday as first day of week: 1 .. true, 0 .. false
    calendar_monday = 1,
    -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
    calendar_mark = 'left-fit',
  }
})
