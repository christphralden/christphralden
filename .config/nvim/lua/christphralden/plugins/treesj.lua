local ok, treesj = pcall(require, "treesj")
if not ok then
  return
end

treesj.setup({
  use_default_keymaps = false,
  max_join_length = 150,
})
