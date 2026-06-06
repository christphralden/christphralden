require("noice").setup({
  presets   = {
    -- bottom_search = true,
  },
  cmdline   = {
    enabled = true,
    view = "cmdline_popup", -- floating popup instead of bottom cmdline
    format = {
      cmdline     = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up   = { kind = "search", pattern = "^?", icon = " ", lang = "regex" },
      filter      = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua         = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help        = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
    },
  },

  messages  = { enabled = false },                 -- don't intercept/reroute :messages output
  notify    = { enabled = false },                 -- don't replace vim.notify (no nvim-notify installed)

  popupmenu = { enabled = false }, -- nvim-cmp handles completion, don't override it

  lsp       = {
    progress  = { enabled = false }, -- no LSP spinner in the cmdline area
    hover     = { enabled = false }, -- keep existing hover setup (lsp.lua)
    signature = { enabled = false }, -- keep existing signature setup
    message   = { enabled = false }, -- don't route LSP messages through noice
    override  = {
      -- let noice render markdown in hover/completion docs via treesitter
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"]                = true,
      ["cmp.entry.get_documentation"]                  = true, -- requires hrsh7th/nvim-cmp
    },
  },

  health    = { checker = false }, -- suppress noice health check warnings
})
