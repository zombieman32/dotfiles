local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	direction = 'float',
	float_opts = {
		border = 'curved',
		width = 100,
		height = 20
	}
})
