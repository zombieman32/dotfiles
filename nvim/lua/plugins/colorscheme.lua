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
        opts = {
            flavor = 'mocha',
            integrations = {
                alpha = true,
                cmp = true,
                dap = true,
                nvimtree = true,
                gitsigns = true,
                headlines = true,
                indent_blankline = {
                    enabled = true,
                    color_indent_levels = true,
                },
                mason = true,
                octo = true,
                mini = {
                    enabled = true,
                    indentscope_color = '',
                },
                --                native_lsp = {
                --                    enabled = true,
                --                    underlines = {
                --                        errors = { 'undercurl' },
                --                        hints = { 'undercurl' },
                --                        warnings = { 'undercurl' },
                --                        information = { 'undercurl' },
                --                    },
                --                    virtual_text = {
                --                        errors = { 'italic' },
                --                        hints = { 'italic' },
                --                        warnings = { 'italic' },
                --                        information = { 'italic' },
                --                    },
                --                    inlay_hints = {
                --                        background = true,
                --                    },
                --                },
                neotree = true,
                notify = true,
                ts_rainbow = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
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
