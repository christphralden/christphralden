local noice_setup, noice = pcall(require, "noice")
if not noice_setup then
  return
end

noice.setup({
  routes    = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "E85: There is no listed buffer" },
          { find = "E486: Pattern not found: ?$" },
          { find = "E490: No fold found" },
          { find = "Already at oldest change" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
          { find = "^%d+ fewer lines;?" },
          { find = "^%d+ more lines;?" },
          { find = "^%d+ line lesses;?" },
          { find = ".*Pattern not found.*$" },
          { find = '^%d+ lines .ed %d+ times?$' },
          { find = '^%d+ lines yanked$' },
          { kind = 'wmsg' },
        }
      },
      opts = { skip = true },
    },
  },
  views     = {
    cmdline_popup = {
      position = {
        row = '30%',
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
  },
  cmdline   = {
    enabled = true,
    view = "cmdline_popup", -- floating popup instead of bottom cmdline
    format = {
      cmdline     = { pattern = "^:", icon = ">", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up   = { kind = "search", pattern = "^?", icon = " ", lang = "regex" },
      filter      = { pattern = "^:%s*[%d,'<>%%]+%s*!", icon = "|>", lang = "bash" },
      shell       = { pattern = "^:%s*!", icon = "$", lang = "bash", title = " Shell " },
      help        = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
    },
  },

  messages  = { enabled = true },                  -- don't intercept/reroute :messages output
  notify    = { enabled = true },                  -- don't replace vim.notify (no nvim-notify installed)

  popupmenu = { enabled = true, backend = 'cmp' }, -- nvim-cmp handles completion, don't override it
  lsp       = {
    progress  = { enabled = false },               -- no LSP spinner in the cmdline area
    hover     = { enabled = false },               -- keep existing hover setup (lsp.lua)
    signature = { enabled = false },               -- keep existing signature setup
    message   = { enabled = false },               -- don't route LSP messages through noice
    override  = {
      -- let noice render markdown in hover/completion docs via treesitter
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"]                = true,
      ["cmp.entry.get_documentation"]                  = true, -- requires hrsh7th/nvim-cmp
    },
  },

  health    = { checker = false }, -- suppress noice health check warnings
})
