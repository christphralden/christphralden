local status, barbeque = pcall(require, "barbeque")
if not status then
	return
end

barbeque.setup({
	options = {
		theme = "tokyonight",
	},
})
