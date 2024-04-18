local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {
	completion.spell,
	completion.tags,
	code_actions.ts_node_action,
	diagnostics.actionlint,
	diagnostics.alex,
	diagnostics.cppcheck,
	diagnostics.deadnix,
	diagnostics.fish,
	diagnostics.gitlint,
	diagnostics.reek,
	diagnostics.statix,
	diagnostics.terraform_validate,
	diagnostics.tfsec,
	diagnostics.todo_comments,
	diagnostics.trail_space,
	formatting.alejandra,
	hover.dictionary,
	hover.printenv,
	null_ls.builtins.formatting.stylua.with({
		extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/lua/user/lsp/settings/stylua.toml") },
	}),
}

null_ls.setup({
	debug = false,
	sources = sources,
	diagnostics_format = "#{s} | #{m}",
})
