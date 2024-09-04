local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"astro",
		"javascript",
		"c",
		"cpp",
		"cmake",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"php",
	},
	-- auto install above language parsers
	auto_install = true,
})
