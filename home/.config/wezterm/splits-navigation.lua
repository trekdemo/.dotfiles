local wezterm = require("wezterm")
local M = {}

function M.apply_to_config(config)
	local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim") -- plugin/init.lua
	smart_splits.apply_to_config(config, {
		-- modifier keys to combine with direction_keys
		modifiers = {
			move = "OPT", -- modifier to use for pane movement, e.g. CTRL+h to move left
			resize = "OPT|SHIFT", -- modifier to use for pane resize, e.g. META+h to resize to the left
		},
		-- log level to use: info, warn, error
		log_level = "info",
	})
end

return M
