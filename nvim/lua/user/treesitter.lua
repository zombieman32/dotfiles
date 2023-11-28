local configs = require("nvim-treesitter.configs")

vim.api.nvim_set_hl(0, "@keyword", { italic = true, bold = true })
vim.api.nvim_set_hl(0, "@def", { italic = true, bold = true })
vim.api.nvim_set_hl(0, "@string", { italic = true, bold = true })
vim.api.nvim_set_hl(0, "@conditional", { italic = true, bold = true })
vim.api.nvim_set_hl(0, "@repeat", { italic = true, bold = true })
vim.api.nvim_set_hl(0, "@exception", { italic = true, bold = true })
vim.api.nvim_set_hl(0, "@comment", { italic = true })

configs.setup({
	ensure_installed = "all",
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "org" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml", "gdscript" } },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
		ensure_installed = { "org" }, -- Or run :TSUpdate org
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})
