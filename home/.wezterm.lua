local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 14
config.line_height = 1.1
-- config.fond = wezterm.font("VictorMono Nerd Font Mono")

config.color_scheme = "Catppuccin Frappe"
config.window_decorations = "RESIZE"

config.enable_tab_bar = true
config.tab_bar_at_bottom = true

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "Catppuccin Frappe",
		section_separators = "",
		component_separators = "",
		tab_separators = "",
	},
	sections = {
		tabline_a = { "mode" },
		tabline_b = {},
		tabline_c = { "domain", "workspace" },
		tab_active = {
			"index",
			-- { "parent", padding = 0 },
			-- "/",
			-- { "cwd", padding = { left = 0, right = 1 } },
			{
				"process",
				process_to_icon = {
					["air"] = { wezterm.nerdfonts.md_language_go },
					["bacon"] = { wezterm.nerdfonts.dev_rust },
					["bat"] = { wezterm.nerdfonts.md_bat },
					["btm"] = { wezterm.nerdfonts.md_chart_donut_variant },
					["btop"] = { wezterm.nerdfonts.md_chart_areaspline },
					["bun"] = { wezterm.nerdfonts.md_hamburger },
					["cargo"] = { wezterm.nerdfonts.dev_rust },
					["curl"] = wezterm.nerdfonts.md_flattr,
					["debug"] = { wezterm.nerdfonts.cod_debug },
					["default"] = wezterm.nerdfonts.md_application,
					["docker"] = { wezterm.nerdfonts.md_docker },
					["docker-compose"] = { wezterm.nerdfonts.md_docker },
					["git"] = { wezterm.nerdfonts.dev_git },
					["kubectl"] = { wezterm.nerdfonts.md_docker },
					["kuberlr"] = { wezterm.nerdfonts.md_docker },
					["lazygit"] = { wezterm.nerdfonts.cod_github },
					["node"] = { wezterm.nerdfonts.md_nodejs },
					["npm"] = { wezterm.nerdfonts.md_npm },
					["nvim"] = { wezterm.nerdfonts.custom_neovim },
				},
			},
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = { "cpu", "battery" },
		tabline_y = { "datetime" },
		tabline_z = {},
	},
})
tabline.apply_to_config(config)

-- wezterm.on("update-right-status", function(window, pane)
-- 	-- "Wed Mar 3 08:14"
-- 	local date = wezterm.strftime("%b %-d %a")
-- 	local time = wezterm.strftime("%H:%M")
--
-- 	window:set_right_status(wezterm.format({
-- 		{ Text = wezterm.nerdfonts.cod_calendar .. " " .. date .. " " .. wezterm.nerdfonts.fa_clock_o .. " " .. time },
-- 	}))
-- end)

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
	top = 0,
	right = 5,
	bottom = 0,
	left = 5,
}

return config
