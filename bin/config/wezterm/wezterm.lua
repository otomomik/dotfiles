local wezterm = require("wezterm")
local config = {}

-- colorscheme
config.color_scheme = "iceberg-dark"

-- WSL
-- config.default_prog = { 'wsl.exe' }

config.window_background_opacity = 0.9

config.keys = {
  {
    key = "N",
    mods = "CTRL|SHIFT",
    action = wezterm.action.DisableDefaultAssignment,
  },
}

return config
