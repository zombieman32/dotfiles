local status_ok, biscuits = pcall(require, "nvim-biscuits")
if not status_ok then
	return
end

vim.api.nvim_set_hl(0, 'BiscuitColor', {fg = "#50fa7b", italic = true})

biscuits.setup({
	on_events = {'CursorHold', 'InsertEnter'},
	default_config = {
		max_length = 12,
		min_distance = 5,
		prefix_string = " 󰅲 "
	},
	cursor_line_only = true,
})
