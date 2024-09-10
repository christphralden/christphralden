local wez = require("wezterm")

local config = wez.config_builder()

-- General Options

config.enable_tab_bar = false
config.window_decorations = "RESIZE" -- "TITLE", "TITLE | RESIZE", "NONE"
config.debug_key_events = false
config.adjust_window_size_when_changing_font_size = false
config.animation_fps = 1
config.max_fps = 30
config.scrollback_lines = 2000

-- Font Options

config.font = wez.font("MesloLGS Nerd Font Mono")
config.font_size = 14

-- Color options

config.color_scheme = "tokyonight"

config.colors = {
	foreground = "#c0caf5", -- Foreground color
	background = "#1a1b26", -- Background color
	cursor_bg = "#c0caf5", -- Cursor background color
	cursor_border = "#c0caf5", -- Cursor border color
	cursor_fg = "#1a1b26", -- Cursor foreground color
	selection_bg = "#33467C", -- Selection background color
	selection_fg = "#c0caf5", -- Selection foreground color
	ansi = {
		"#15161E", -- Black
		"#f7768e", -- Red
		"#9ece6a", -- Green
		"#e0af68", -- Yellow
		"#7aa2f7", -- Blue
		"#bb9af7", -- Magenta
		"#7dcfff", -- Cyan
		"#a9b1d6", -- White
	},
	brights = {
		"#414868", -- Bright Black
		"#f7768e", -- Bright Red
		"#9ece6a", -- Bright Green
		"#e0af68", -- Bright Yellow
		"#7aa2f7", -- Bright Blue
		"#bb9af7", -- Bright Magenta
		"#7dcfff", -- Bright Cyan
		"#c0caf5", -- Bright White
	},
}

-- Dimmer for background
local dimmer = {
	brightness = 0.05,
	saturation = 0.75,
}

-- Define the two background options (wallpaper and transparent)
local background_with_wallpaper = {
	{
		source = {
			File = wez.config_dir .. "/backgrounds/chaeyoung-1.jpeg",
			-- File = wez.config_dir .. "/backgrounds/pain.jpg",
			-- File = wez.config_dir .. "/backgrounds/azumanga.gif",
		},
		width = "Cover",
		height = "Cover",
		vertical_align = "Middle",
		horizontal_align = "Center",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		opacity = 1,
		hsb = dimmer,
	},
}

local transparent_background = {
	{
		source = {
			Color = "#1a1b26",
		},
		width = "100%",
		height = "100%",
		opacity = 0.9,
	},
}

-- Initialize with the wallpaper by default
config.background = background_with_wallpaper

-- Toggle function between the two backgrounds
local current_background = "wallpaper"

wez.on("toggle-background", function(window)
	if current_background == "wallpaper" then
		-- Switch to transparent background
		config.background = transparent_background
		current_background = "transparent"
		config.window_background_opacity = 0
		config.macos_window_background_blur = 30
	else
		-- Switch to wallpaper
		config.background = background_with_wallpaper
		current_background = "wallpaper"
		config.window_background_opacity = 1
		config.macos_window_background_blur = 0
	end
	window:set_config_overrides(config)
end)

config.keys = {
	{
		key = "b",
		mods = "CTRL|SHIFT",
		action = wez.action.EmitEvent("toggle-background"),
	},
}

-- Window options

config.window_padding = {
	left = 40,
	right = 40,
	top = 40,
	bottom = 20,
}

config.native_macos_fullscreen_mode = false

return config
