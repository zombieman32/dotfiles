return {

    -- tokyonight
    {
        'folke/tokyonight.nvim',
        lazy = true,
        opts = { style = 'moon' },
    },

    -- catppuccin
    {
        'catppuccin/nvim',
        lazy = true,
        name = 'catppuccin',
        priority = 1000,
        opts = {
            flavor = 'mocha',
            transparent_background = true,
            styles = {
                booleans = { 'underdouble' },
                loops = { 'undercurl' },
                functions = { 'bold' },
            },
            integrations = {
                alpha = true,
                cmp = true,
                dap = true,
                dap_ui = true,
                nvimtree = true,
                gitsigns = true,
                headlines = true,
                indent_blankline = {
                    enabled = true,
                    color_indent_levels = true,
                    indentscope_color = 'teal'
                },
                mason = true,
                octo = true,
                mini = {
                    enabled = true,
                    indentscope_color = 'teal',
                },
                -- noice = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { 'undercurl' },
                        hints = { 'undercurl' },
                        warnings = { 'undercurl' },
                        information = { 'undercurl' },
                    },
                    virtual_text = {
                        errors = { 'italic' },
                        hints = { 'italic' },
                        warnings = { 'italic' },
                        information = { 'italic' },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                neotree = true,
                notify = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                rainbow_delimiters = true,
                which_key = true,
            },
        },
    },

    -- Kanagawa
    { 'rebelot/kanagawa.nvim', lazy = true },

    -- One Dark Pro
    { 'olimorris/onedarkpro.nvim', lazy = true },

    -- Tokyo Night
    { 'folke/tokyonight.nvim', lazy = true },
}
