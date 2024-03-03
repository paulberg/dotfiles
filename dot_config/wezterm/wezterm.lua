-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Use git bash as defaul shell
-- TODO: This should tie into scoop
config.default_prog = { 'C:/Program Files/Git/bin/bash.exe' }

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
--config.color_scheme = 'AdventureTime'
config.color_scheme = 'Grey-green'

-- and finally, return the configuration to wezterm
return config
