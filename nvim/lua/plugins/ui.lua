return {
    -- Icons
    'nvim-tree/nvim-web-devicons',

    -- Indent lines
    {
        'lukas-reineke/indent-blankline.nvim',
        name = 'ibl',
        config = function()
            local highlight = {
                'RainbowRed',
                'RainbowYellow',
                'RainbowBlue',
                'RainbowOrange',
                'RainbowGreen',
                'RainbowViolet',
                'RainbowCyan',
            }

            local mocha = require('catppuccin.palettes').get_palette('mocha')
            local hooks = require('ibl.hooks')
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, 'RainbowRed', { fg = mocha.red })
                vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = mocha.yellow })
                vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = mocha.blue })
                vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = mocha.peach })
                vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = mocha.green })
                vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = mocha.mauve })
                vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = mocha.sky })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require('ibl').setup({
                indent = {
                    highlight = highlight,
                },
                whitespace = {
                    highlight = { 'Whitespace', 'NonText' },
                },
                scope = {
                    highlight = highlight,
                },
            })

            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
    },

    -- Change numbercolumn color depending on mode
    {
        'mawkler/modicator.nvim',
        event = 'ModeChanged',
        dependencies = 'catppuccin', -- Add your colorscheme plugin here
        lazy = true,
        init = function()
            -- These are required for Modicator to work
            vim.o.cursorline = true
            vim.o.number = true
            vim.o.termguicolors = true
        end,
        opts = {
            show_warnings = true,
            highlights = {
                defaults = { bold = true },
            },
        },
    },

    -- Better UI
    'stevearc/dressing.nvim',

    -- Dim parts of the code you're not working on
    'folke/twilight.nvim',

    -- Zen mode
    {
        'folke/zen-mode.nvim',
        opts = {
            window = {
                width = 0.8,
                height = 1,
            },
            plugins = {
                options = {
                    show_cmd = true,
                },
                twilight = { enabled = true },
                gitsigns = { enabled = true },
                tmux = { enabled = true },
                kitty = {
                    enabled = true,
                    font = '+4',
                },
            },
        },
        config = function()
            local mocha = require('catppuccin.palettes').get_palette('mocha')

            vim.api.nvim_set_hl(0, 'ZenBg', { bg = mocha.base })
        end,
    },

    -- Adjust shiftwidth and expantab based on current file
    'tpope/vim-sleuth',

    -- Prettier folds
    {
        'anuvyklack/pretty-fold.nvim',
        config = function()
            local prettyfold = require('pretty-fold')

            prettyfold.setup({
                sections = {
                    left = {
                        'content',
                    },
                    right = {
                        ' ',
                        'number_of_folded_lines',
                        ': ',
                        'percentage',
                        ' ',
                        function(config)
                            return config.fill_char:rep(3)
                        end,
                    },
                },
                fill_char = '•',

                remove_fold_markers = true,

                -- Keep the indentation of the content of the fold string.
                keep_indentation = true,

                -- Possible values:
                -- "delete" : Delete all comment signs from the fold string.
                -- "spaces" : Replace all comment signs with equal number of spaces.
                -- false    : Do nothing with comment signs.
                process_comment_signs = 'spaces',

                -- Comment signs additional to the value of `&commentstring` option.
                comment_signs = {},

                -- List of patterns that will be removed from content foldtext section.
                stop_words = {
                    '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
                },

                add_close_pattern = true, -- true, 'last_line' or false

                matchup_patterns = {
                    { '{', '}' },
                    { '%(', ')' }, -- % to escape lua pattern char
                    { '%[', ']' }, -- % to escape lua pattern char
                },

                ft_ignore = { 'neorg' },
            })
        end,
    },

    -- Experimental UI improvements
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            popupmenu = {
                backend = 'cmp',
            },
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        config = function()
            require('noice').setup({})
        end,
    },

    -- More UI improvements
    {
        'CosmicNvim/cosmic-ui',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        config = true,
    },

    -- Buffer switcher
    'matbme/JABS.nvim',
}
