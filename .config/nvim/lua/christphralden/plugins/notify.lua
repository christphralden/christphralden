local notify_setup, notify = pcall(require, "notify")
if not notify_setup then
  return
end

notify.setup({
  background_colour = "#1e1e2e",
  stages = "fade",
})
