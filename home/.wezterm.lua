local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 14
config.line_height = 1.1
-- config.fond = wezterm.font("VictorMono Nerd Font Mono")
config.color_scheme = "catppuccin-frappe"
config.window_decorations = "RESIZE"
config.enable_tab_bar = true

wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%b %-d %a ")
	local time = wezterm.strftime("%H:%M ")

	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.cod_calendar .. " " .. date .. " " .. wezterm.nerdfonts.fa_clock_o .. " " .. time },
	}))
end)

return config
