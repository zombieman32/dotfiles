local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	flavor = "mocha",
	integrations = {
		alpha = true,
		cmp = true,
		dap = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		treesitter_context = true,
		ts_rainbow = true,
		octo = true,
		notify = true,
		mason = true,
		which_key = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		telescope = {
			enabled = true,
			-- style = "nvchad"
		},
	},
})
