-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Gruvbox dark, hard (base16)'
  else
    return 'Gruvbox light, hard (base16)'
  end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 13.0
-- config.line_height = 1.2
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'

-- and finally, return the configuration to wezterm
return config
