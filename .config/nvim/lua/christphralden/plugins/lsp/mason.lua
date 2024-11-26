local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")

if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"cmake",
		"cssmodules_ls",
		"jsonls",
		"jdtls",
		"pyright",
		"intelephense",
		"gopls",
		"ts_ls",
		"html",
		"cssls",
		-- "tailwindcss",
		"lua_ls",
		"emmet_ls",
		-- "kotlin_language_server",
		"astro",
	},
	automatic_installation = true,
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"black", -- python formatter
		"gofmt", -- golang formatter
		"clang-format", -- c/c++ formatter
	},
	automatic_installation = true,
})
