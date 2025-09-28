local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local M = {}

function M.apply_to_config(config)
	config.enable_tab_bar = true
	config.tab_bar_at_bottom = true

	tabline.setup({
		options = {
			theme = "Catppuccin Frappe",
			section_separators = "",
			component_separators = "",
			tab_separators = " ",
		},
		sections = {
			tabline_a = { "mode" },
			tabline_b = { "domain", "workspace" },
			tabline_c = {},
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
end

return M
