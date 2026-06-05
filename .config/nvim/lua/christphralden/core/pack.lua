vim.pack.add({
  -- colors
  "https://github.com/rose-pine/neovim", -- lua functions
  -- essentials
  "https://github.com/nvim-lua/plenary.nvim", -- lua functions
  "https://github.com/christoomey/vim-tmux-navigator", -- enable tmux navigation in nvim
  "https://github.com/szw/vim-maximizer", -- enable pane maximizing
  "https://github.com/tpope/vim-surround", ---- surrounding characters [cs<curr_char><to_char>, ds<char>, ysw<char>] 
  "https://github.com/vim-scripts/ReplaceWithRegister", -- enable pane maximizing
  "https://github.com/numToStr/Comment.nvim", -- enable pane maximizing
  -- autopair stuffs
  "https://github.com/windwp/nvim-autopairs", 
  "https://github.com/windwp/nvim-ts-autotag", 
  -- telescope
  { src = "https://github.com/nvim-telescope/telescope.nvim", branch = "main" }, 
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim", -- fzf with telescope (requires manual: make -C ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim)
  -- treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
  -- lsp
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  -- git
  "https://github.com/tpope/vim-fugitive", -- git operations
  "https://github.com/lewis6991/gitsigns.nvim", -- git line diffs
  -- fast boi
  "https://github.com/cbochs/grapple.nvim",


  -- [deps] required by some plugins
  "https://github.com/nvim-tree/nvim-web-devicons"
})

