local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
	return
end

local get_hex = require("cokeline/utils").get_hex

cokeline.setup({
	buffers = {
		focus_on_delete = "prev",
		new_buffers_position = "next",
	},
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and "#191A21" or "#D6ACFF"
		end,
		bg = function(buffer)
			return buffer.is_focused and "#FF92DF" or "#BD93F9"
		end,
	},
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = "  NvimTree",
				fg = "#f1fa8c",
				bg = get_hex("Normal", "bg"),
				style = "bold",
			},
		},
	},

	components = {
		{
			text = " ",
			bg = get_hex("Normal", "bg"),
		},
		{
			text = "█",
			fg = function(buffer)
				return buffer.is_focused and "#FF92DF" or "#BD93F9"
			end,

			bg = get_hex("Normal", "bg"),
		},
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = " ",
		},
		{
			text = function(buffer)
				return buffer.filename .. "  "
			end,
			style = function(buffer)
				return buffer.is_focused and "bold" or nil
			end,
		},
		{
			text = "󰅖",
			delete_buffer_on_left_click = true,
		},
		{
			text = "█",
			fg = function(buffer)
				return buffer.is_focused and "#FF92DF" or "#BD93F9"
			end,
			bg = get_hex("Normal", "bg"),
		},
	},
	mappings = {
		cycle_prev_next = true,
	},
})
