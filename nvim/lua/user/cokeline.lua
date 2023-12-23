local status_ok, cokeline = pcall(require, "cokeline")
if not status_ok then
	return
end

local mocha = require("catppuccin.palettes").get_palette "mocha"

local switch = {
	[1] = "#f38ba8",
	[2] = "#eba0ac",
	[3] = "#f2cdcd",
	[4] = "#fab387",
	[5] = "#f9e2af",
	[6] = "#a6e3a1",
	[7] = "#94e2d5",
	[8] = "#89dceb",
	[9] = "#74c7ec",
	[10] = "#89b4fa",
	[11] = "#b4befe",
	[0] = "#cba6f7",
}

cokeline.setup({
	buffers = {
		focus_on_delete = "prev",
		new_buffers_position = "next",
	},
	pick = {
		use_filename = false,
		letters = '<123456789qwertyuiopasdfghjklñzxcvbnm,.',
	},
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and mocha.base or mocha.text
		end,
		bg = function(buffer)
			return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or mocha.surface1
		end,
	},
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = "  NvimTree 󰙅",
				fg = mocha.sapphire,
				bg = mocha.base,
				style = "bold",
			},
		},
	},

	components = {
		{
			text = " ",
			bg = mocha.base,
		},
		{
			text = "█",
			fg = function(buffer)
				return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or mocha.surface1
			end,

			bg = mocha.base,
		},
		{
			text = function(buffer)
				return buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.is_focused and mocha.base or buffer.devicon.color
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
				return buffer.is_focused and switch[math.fmod(buffer.index, 7)] or mocha.surface1
			end,
			bg = mocha.base,
		},
	},
	mappings = {
		cycle_prev_next = true,
	},
})
