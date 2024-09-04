local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()
cmp.setup.cmdline("/", { -- CMP For Noice
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", { -- CMP For Noice
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	},
})

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-k>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 5 }, -- lsp
		{ name = "luasnip", max_item_count = 3 }, -- snippet
		{ name = "buffer", max_item_count = 3 }, -- text within current buffer
		{ name = "path", max_item_count = 3 }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
