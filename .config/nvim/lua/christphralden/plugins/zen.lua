local zen_ok, zen = pcall(require, 'zen-mode')
if not zen_ok then
  return
end
zen.setup {
  window = {
    width = 0.6,
  },
}
