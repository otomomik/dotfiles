local wezterm = require("wezterm")
local config = {}

-- colorscheme
config.color_scheme = "iceberg-dark"

-- Window
config.window_background_opacity = 0.9
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- Tab
config.hide_tab_bar_if_only_one_tab = true

-- Keybindings
config.keys = {
	{
		key = "N",
		mods = "CTRL|SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config
