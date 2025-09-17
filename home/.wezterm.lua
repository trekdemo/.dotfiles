local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 14
config.line_height = 1.1
-- config.fond = wezterm.font("VictorMono Nerd Font Mono")

config.color_scheme = "catppuccin-frappe"
config.window_decorations = "RESIZE"

config.enable_tab_bar = true
-- config.tab_bar_at_bottom = true

wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%b %-d %a")
	local time = wezterm.strftime("%H:%M")

	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.cod_calendar .. " " .. date .. " " .. wezterm.nerdfonts.fa_clock_o .. " " .. time },
	}))
end)

config.skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "tmux" }

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
	},
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "H",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = "LEADER",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = "1px",
}

return config
