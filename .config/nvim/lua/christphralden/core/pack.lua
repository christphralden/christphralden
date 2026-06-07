vim.pack.add({
  -- colors
  "https://github.com/rose-pine/neovim",               -- lua functions
  -- essentials
  "https://github.com/nvim-lua/plenary.nvim",          -- lua functions
  "https://github.com/christoomey/vim-tmux-navigator", -- enable tmux navigation in nvim
  "https://github.com/szw/vim-maximizer",              -- enable pane maximizing
  "https://github.com/tpope/vim-surround",             ---- surrounding characters [cs<curr_char><to_char>, ds<char>, ysw<char>]
  "https://github.com/vim-scripts/ReplaceWithRegister",
  "https://github.com/numToStr/Comment.nvim",
  -- autopair stuffs
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/windwp/nvim-ts-autotag",
  -- telescope
  { src = "https://github.com/nvim-telescope/telescope.nvim",   branch = "main" },
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim", -- fzf with telescope (requires manual: make -C ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim)
  -- treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  -- lsp
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  -- completion
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-cmdline",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/saadparwaiz1/cmp_luasnip",
  "https://github.com/onsails/lspkind.nvim",
  -- formatting & linting
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  -- git
  "https://github.com/tpope/vim-fugitive",      -- git operations
  "https://github.com/lewis6991/gitsigns.nvim", -- git line diffs
  -- fast boi
  "https://github.com/cbochs/grapple.nvim",
  -- [deps] required by some plugins
  "https://github.com/nvim-tree/nvim-web-devicons",
  -- noice: floating cmdline + UI components
  "https://github.com/MunifTanjim/nui.nvim", -- required: UI primitives (popups, inputs, layouts)
  "https://github.com/rcarriga/nvim-notify", -- optional: replaces vim.notify with styled notifications (unused - messages disabled)
  "https://github.com/folke/noice.nvim",

  -- nice to haves
  "https://github.com/folke/zen-mode.nvim",

  "https://github.com/rmagatti/goto-preview" -- lsp on crack
})
