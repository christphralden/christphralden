local scratchpad_ok, scratchpad = pcall(require, 'scratchpad')
if not scratchpad_ok then
  return
end

scratchpad.setup({
  settings = {
    sync_on_ui_close = true,
    title = " Notes "
  },
})
