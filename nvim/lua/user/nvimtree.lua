require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	tab = {
		sync = {
			open = false,
		},
	},
	hijack_cursor = false,
	sync_root_with_cwd = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	system_open = {
		cmd = "",
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		timeout = 500,
	},
	view = {
		width = 30,
		side = "left",
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
	},
	ui = {
		confirm = {
			trash = true,
		},
	},
	renderer = {
		highlight_git = false,
		root_folder_label = ":t",
		icons = {
			show = {
				git = true,
				folder = true,
				folder_arrow = true,
				file = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	actions = {
		open_file = {
			resize_window = true,
			window_picker = {
				enable = false,
			},
		},
	},
})
