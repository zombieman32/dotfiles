local status_ok, modicator = pcall(require, "modicator")
if not status_ok then
	return
end


modicator.setup({
	highlights = {
		-- Default options for bold/italic
		defaults = {
			italic = true,
		},
	},
})
