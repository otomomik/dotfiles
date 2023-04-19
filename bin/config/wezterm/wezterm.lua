local wezterm = require("wezterm")
local config = {}

-- colorscheme
config.color_scheme = "iceberg-dark"

-- WSL
-- config.default_prog = { 'wsl.exe' }

config.keys = {
  {
    key = '|',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = '_',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical {
      domain = 'CurrentPaneDomain'
    },
  },
}


return config
