local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_tokyonight = require("lualine.themes.tokyonight")

-- theme colors from tokyonight
local new_colors = {
	blue = "#7aa2f7",
	green = "#9ece6a",
	violet = "#bb9af7",
	yellow = "#e0af68",
	black = "#1a1b26",
}

-- change tokyonight theme colors
lualine_tokyonight.normal.a.bg = new_colors.blue
lualine_tokyonight.insert.a.bg = new_colors.green
lualine_tokyonight.visual.a.bg = new_colors.violet
lualine_tokyonight.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_tokyonight,
	},
})

-- Additional lualine setup for tokyonight theme
require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
})
