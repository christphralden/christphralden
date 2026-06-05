local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

mason.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = {"vim"} },
    }
  }
})

-- if instalation fails, check .npmrc minReleaseAge
mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"cmake",
		"cssmodules_ls",
		"jsonls",
		"jdtls",
		"pyright",
		-- "intelephense",
		"gopls",
		"ts_ls",
		"html",
		"cssls",
		"lua_ls",
		"emmet_ls",
		"astro",
	},
	automatic_installation = true,
})
