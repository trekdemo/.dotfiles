---@type Wezterm
local wezterm = require("wezterm")
---@type Action
local act = wezterm.action
---@type Config
local config = wezterm.config_builder()

config.font = wezterm.font("VictorMono Nerd Font Mono", { weight = "Medium" })
config.font_size = 14
config.line_height = 1.0
config.bold_brightens_ansi_colors = true

config.color_scheme = "Catppuccin Frappe"

config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true
-- config.window_padding = { top = "0.5cell", right = "1cell", bottom = 0, left = "1cell" }
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.8 }
config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "tmux" }

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = act.SendKey({ key = "a", mods = "CTRL" }),
	},
	{
		key = "e",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},

	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

	-- Create splits
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = ",",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				PATH = os.getenv("PATH") .. ":/opt/homebrew/bin/",
			},
			args = {
				"vim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
}

require("tabline").apply_to_config(config)
require("splits-navigation").apply_to_config(config)

return config
