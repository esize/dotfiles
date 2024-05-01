local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'Geist Mono'
config.color_scheme = 'Catppuccin Macchiato'

config.enable_tab_bar = false
config.default_cursor_style = 'SteadyBar'

return config
