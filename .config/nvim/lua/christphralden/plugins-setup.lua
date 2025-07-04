-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions
	use("bluz71/vim-nightfly-guicolors") -- colorscheme
	use({
		-- "folke/tokyonight.nvim",
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		opts = {},
	})
	use("christoomey/vim-tmux-navigator") -- tab navigator [tn, tp, tn, tx], [sx,sh,sv,se], [ctrl + movementkeys]
	use("szw/vim-maximizer") -- maximizes and restores current window [<leader>sm]

	-- essentials
	use("tpope/vim-surround") -- surrounding characters [cs<curr_char><to_char>, ds<char>, ysw<char>]
	use("vim-scripts/ReplaceWithRegister") -- replace word [gr+ w, $, c, r]

	-- comment
	use("numToStr/Comment.nvim") -- comment shortcts [gcc, gc<number>j]

	-- file explorer
	-- use("nvim-tree/nvim-tree.lua") -- file explorer [<action> e]

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- status bar
	-- use("nvim-lualine/lualine.nvim")
	-- use({
	-- 	"utilyre/barbecue.nvim",
	-- 	tag = "*",
	-- 	requires = {
	-- 		"SmiteshP/nvim-navic",
	-- 		"nvim-tree/nvim-web-devicons", -- optional dependency
	-- 	},
	-- 	config = function()
	-- 		require("barbecue").setup()
	-- 	end,
	-- })

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder [<action> + j, u]

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-nvim-lua") -- Lua source for nvim config
	use("hrsh7th/cmp-cmdline")

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- lspkind for icons
	use("onsails/lspkind-nvim")

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion [gd (definition), gi (impimentation), ]d (goto err), <leader>ca actions]
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	-- use({
	-- 	"virchau13/tree-sitter-astro",
	-- 	requires = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	--[[ run = ":TSInstall astro", ]]
	-- }) -- fucking astro, but i love astro

	-- ui
	-- use("stevearc/dressing.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	-- use("jwalton512/vim-blade") -- blade template

	-- autosave

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- transparent background
	-- use("xiyaowong/transparent.nvim")

	-- xml
	use("chrisbra/vim-xml-runtime")

	-- markdown
	use({
		"MeanderingProgrammer/render-markdown.nvim",
		-- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
		-- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
		requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- if you prefer nvim-web-devicons
		config = function()
			require("render-markdown").setup({})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
