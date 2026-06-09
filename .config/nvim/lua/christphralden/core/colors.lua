local ok, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not ok then
  print("Colorscheme not found")
  return
end
