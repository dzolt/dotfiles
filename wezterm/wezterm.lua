-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

local config = {
}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('Monaspace Krypton', {weight = 'Medium' }) 

config.keys = {
 { 
   key = 'K',
   mods = 'CMD|SHIFT',
   action = act.ClearScrollback 'ScrollbackAndViewport',
 }
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

return config
