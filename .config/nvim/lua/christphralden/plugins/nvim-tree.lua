local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- settings from docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#bb9af7]])

nvimtree.setup({
	-- change folder arrow icons
	view = {
		side = "right",
	},
	filters = {
		custom = { "\\.git$", "\\.pyc$", "__pycache__" },
	},
	renderer = {
		indent_markers = {
			enable = false,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false,
					color = true,
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	git = {
		ignore = false,
	},
})
