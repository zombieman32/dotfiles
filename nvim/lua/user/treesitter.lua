local configs = require("nvim-treesitter.configs")


vim.api.nvim_set_hl(0, '@keyword', {italic = true, bold = true})
vim.api.nvim_set_hl(0, '@def', {italic = true, bold = true})
vim.api.nvim_set_hl(0, '@string', {italic = true, bold = true})
vim.api.nvim_set_hl(0, '@conditional', {italic = true, bold = true})
vim.api.nvim_set_hl(0, '@repeat', {italic = true, bold = true})
vim.api.nvim_set_hl(0, '@exception', {italic = true, bold = true})
vim.api.nvim_set_hl(0, '@comment', {italic = true})

configs.setup {
  ensure_installed = "all",
  sync_install = true,
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
