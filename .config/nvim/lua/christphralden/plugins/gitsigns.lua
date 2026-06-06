local gitsigns_setup, gitsigns = pcall(require, "gitsigns.nvim")
if not gitsigns_setup then
  return
end

gitsigns.setup({
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  linehl = true,
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  current_line_blame = true
})
