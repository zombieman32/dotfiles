local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return " " .. str .. " "
	end,
}

local filename = {
	"filename",
	fmt = function(str)
		return " " .. str .. " "
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0.5,
}

local icons = {
		"",
		"",
		"",
		"",
		"󱓞",
		"󰥟",
		"󰟕",
		"󱎓",
		"",
		"󰣙",
		"󰣘",
		"󰽯",
		"󰽰",
		"󰎈",
		"󰽭",
		"󰽫",
		"",
		"󰡚",
		"󰡗",
		"󰡜",
		"󰡛",
		"󰡘",
		"󰡙",
		"",
		"󰝱",
		"󰙽",
		"󰚩",
		"󱚝",
		"󱚟",
		"󱚡",
		"󱚣",
		"󱚥",
		"󰳆",
		"󰏒",
		"󰩃",
		"󱐍",
		"",
		"",
		"󰜂",
		"󱓷",
		"󱉟",
		"󱗂",
		"",
		"",
		"",
		"",
		"󰦚",
		"󱢢",
		"󱢦",
		"󱢪",
		"󱢮",
		"",
		"󰟡",
		"󰖫",
		"󰯙",
		"",
		"󰔱",
		"󰩑",
		"󱌴",
		"󰍳",
	}
local random = math.random(0, #icons - 1)

local function cat()
		local icon = icons[random]
	return icon
end
-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	-- { "󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂁", "󰁹" }
	local chars = {"","","","","","","","","","","","","","",""}
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local function is_active()
    local ok, hydra = pcall(require, 'hydra.statusline')
    return ok and hydra.is_active()
end

local function get_name()
    local ok, hydra = pcall(require, 'hydra.statusline')
    if ok then
        return hydra.get_name()
    end
    return ''
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin-mocha",
		component_separators = { left = ")", right = "(" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode, {get_name, cond = is_active} },
		lualine_c = {filename},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { cat, diff, spaces, filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
