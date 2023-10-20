local status_ok, masonti = pcall(require, "mason-tool-installer")
if not status_ok then
	return
end

masonti.setup({
	ensure_installed = {
	"prettier",
	"black",
	"stylua",
	"clang-format",
	"djlint",
	"joker",
	"ktlint",
	"latexindent",
	"rubocop",
	"sqlfmt",
	"buildifier",
	"fourmolu",
	"shfmt",
	"stylua",
	"flake8",
	"checkstyle",
	"cpplint",
	"eslint_d",
	"hadolint",
	"clj_kondo",
	"selene",
	"sqlfluff",
	"stylelint",
	"buildifier",
	"curlylint",
	"vint",
	"yamllint"
	}
})
