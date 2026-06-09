local grapple_setup, grapple = pcall(require, "grapple")
if not grapple_setup then
  return
end

grapple.setup({
  scope = "git_branch",
  win_opts = {
    footer = "" -- i dont like footer
  }
})

vim.api.nvim_set_hl(0, "GrappleName", { bg = "#ebbcba", bold = true })
