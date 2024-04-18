local servers = {
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
	"csharpier",
	"gdtoolkit",
	"flake8",
	"checkstyle",
	"cpplint",
	"eslint_d",
	"hadolint",
	"clj-kondo",
	"selene",
	"sqlfluff",
	"stylelint",
	"curlylint",
	"vint",
	"yamllint",
	"trivy",
	"checkmake",
	"codespell",
	"proselint"
	}

require("mason-null-ls").setup({
	ensure_installed = servers,
	automatic_installation = true,
	handlers = {},
})
