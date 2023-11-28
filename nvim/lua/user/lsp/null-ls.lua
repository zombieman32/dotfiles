local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.completion.spell,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.clang_format,
		formatting.djlint,
		formatting.joker,
		formatting.ktlint,
		formatting.latexindent,
		formatting.rubocop,
		formatting.sqlfmt,
		formatting.buildifier,
		formatting.fourmolu,
		formatting.shfmt,
		formatting.stylua,
		formatting.astgrep,
		formatting.gdformat,
		diagnostics.flake8,
		diagnostics.checkstyle,
		diagnostics.cpplint,
		diagnostics.djlint,
		diagnostics.eslint_d,
		diagnostics.hadolint,
		diagnostics.clj_kondo,
		diagnostics.ktlint,
		diagnostics.rubocop,
		diagnostics.selene,
		diagnostics.sqlfluff,
		diagnostics.stylelint,
		diagnostics.buildifier,
		diagnostics.curlylint,
		diagnostics.vint,
		diagnostics.yamllint,
		diagnostics.astgrep,
		diagnostics.gdlint
	},
})
