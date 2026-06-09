local gitsigns_setup, gitsigns = pcall(require, "gitsigns")
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
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  current_line_blame = true
})
