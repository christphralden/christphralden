local grapple_setup, grapple = pcall(require, "grapple")
if not grapple_setup then
  return
end

grapple.setup({
  scope = "git_branch",
})

