local goto_preview_ok, goto_preview = pcall(require, 'goto-preview')
if not goto_preview_ok then
  return
end

goto_preview.setup({
  default_mappings = false,
  same_file_float_preview = false
})
