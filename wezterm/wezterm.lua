-- Pull in the wezterm API
local wezterm = require("wezterm")
require("status")

-- This table will hold the configuration.
local config = {
	font = wezterm.font_with_fallback({
		{ family = "Cica" },
		{ family = "Cica", assume_emoji_presentation = true },
	}),
	font_size = 18.0,
	color_scheme = "Tokyo Night Moon",
	use_ime = true,
	status_update_interval = 1000,
}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
-- if wezterm.config_builder then
--	config = wezterm.config_builder()
-- end

-- and finally, return the configuration to wezterm
return config
