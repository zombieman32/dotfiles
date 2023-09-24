local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
	return
end

local switch = {
	[1] = "#ef596f",
	[2] = "#d19a66",
	[3] = "#e5c07b",
	[4] = "#89ca78",
	[5] = "#2bbac5",
	[6] = "#61afef",
	[0] = "#d55fde",
}

cokeline.setup({
	buffers = {
		focus_on_delete = "prev",
		new_buffers_position = "next",
	},
	pick = {
		use_filename = false,
	},
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and "#282c34" or "#ABB2BF"
		end,
		bg = function(buffer)
			return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or "#5C6370"
		end,
	},
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = "  NvimTree 󰙅",
				fg = "#8BE9FD",
				bg = "#282c34",
				style = "bold",
			},
		},
	},

	components = {
		{
			text = " ",
			bg = "#282c34",
		},
		{
			text = "█",
			fg = function(buffer)
				return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or "#5C6370"
			end,

			bg = "#282c34",
		},
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.is_focused and "#282c34" or buffer.devicon.color
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
				return buffer.is_focused and "italic,bold" or nil
			end,
		},
		{
			text = "󰅖",
			delete_buffer_on_left_click = true,
		},
		{
			text = "█",
			fg = function(buffer)
				return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or "#5C6370"
			end,
			bg = "#282c34",
		},
	},
	mappings = {
		cycle_prev_next = true,
	},
})
