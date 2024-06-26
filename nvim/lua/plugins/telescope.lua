return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'polirritmico/telescope-lazy-plugins.nvim' },
            { 'OliverChao/telescope-picker-list.nvim' },
            'SalOrak/whaler',
            'ANGkeith/telescope-terraform-doc.nvim',
            'nvim-telescope/telescope-node-modules.nvim',
        },
        config = function()
            local telescope = require('telescope')

            local actions = require('telescope.actions')

            telescope.setup({
                defaults = {

                    prompt_prefix = ' |',
                    selection_caret = ' ',
                    path_display = { 'smart' },

                    mappings = {
                        i = {
                            ['<C-n>'] = actions.cycle_history_next,
                            ['<C-p>'] = actions.cycle_history_prev,

                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,

                            ['<C-c>'] = actions.close,

                            ['<Down>'] = actions.move_selection_next,
                            ['<Up>'] = actions.move_selection_previous,

                            ['<CR>'] = actions.select_default,
                            ['<C-x>'] = actions.select_horizontal,
                            ['<C-v>'] = actions.select_vertical,
                            ['<C-t>'] = actions.select_tab,

                            ['<C-u>'] = actions.preview_scrolling_up,
                            ['<C-d>'] = actions.preview_scrolling_down,

                            ['<PageUp>'] = actions.results_scrolling_up,
                            ['<PageDown>'] = actions.results_scrolling_down,

                            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                            ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                            ['<C-l>'] = actions.complete_tag,
                            ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
                        },

                        n = {
                            ['<esc>'] = actions.close,
                            ['<CR>'] = actions.select_default,
                            ['<C-x>'] = actions.select_horizontal,
                            ['<C-v>'] = actions.select_vertical,
                            ['<C-t>'] = actions.select_tab,

                            ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                            ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                            ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                            ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                            ['j'] = actions.move_selection_next,
                            ['k'] = actions.move_selection_previous,
                            ['H'] = actions.move_to_top,
                            ['M'] = actions.move_to_middle,
                            ['L'] = actions.move_to_bottom,

                            ['<Down>'] = actions.move_selection_next,
                            ['<Up>'] = actions.move_selection_previous,
                            ['gg'] = actions.move_to_top,
                            ['G'] = actions.move_to_bottom,

                            ['<C-u>'] = actions.preview_scrolling_up,
                            ['<C-d>'] = actions.preview_scrolling_down,

                            ['<PageUp>'] = actions.results_scrolling_up,
                            ['<PageDown>'] = actions.results_scrolling_down,

                            ['?'] = actions.which_key,
                        },
                    },
                },
                -- pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
                -- },
                extensions = {
                    media_files = {
                        -- filetypes whitelist
                        -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                        filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
                        find_cmd = 'rg', -- find command (defaults to `fd`)
                    },
                    heading = {
                        treesitter = true,
                    },
                    lazy = {
                        theme = 'catppuccin',
                    },
                },
            })

            telescope.load_extension('media_files')
            telescope.load_extension('bookmarks')
            telescope.load_extension('nerdy')
            telescope.load_extension('foldmarkers')
            telescope.load_extension('hop')
            telescope.load_extension('terraform_doc')
            telescope.load_extension('heading')
            telescope.load_extension('zoxide')
            telescope.load_extension('docker')
            telescope.load_extension('rails')
            telescope.load_extension('undo')
            telescope.load_extension('lazy_plugins')
            telescope.load_extension('tmux')
            telescope.load_extension('emoji')
            telescope.load_extension('lsp_handlers')
            telescope.load_extension('node_modules')
            telescope.load_extension('http')
            telescope.load_extension('dap')
            telescope.load_extension('ht')
            -- telescope.load_extension('noice')
        end,
    },

    --Telescope zoxide integration
    {
        'jvgrootveld/telescope-zoxide',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },

    -- Undo tree in Telescope
    {
        'debugloop/telescope-undo.nvim',
        dependencies = { -- note how they're inverted to above example
            {
                'nvim-telescope/telescope.nvim',
                dependencies = { 'nvim-lua/plenary.nvim' },
            },
        },
        keys = {
            { -- lazy style key map
                '<leader>u',
                '<cmd>Telescope undo<cr>',
                desc = 'undo history',
            },
        },
    },

    -- Preview media files in Telescope
    {
        'nvim-telescope/telescope-media-files.nvim',
        lazy = true,
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },

    -- Search symbols in Telescope
    {
        'nvim-telescope/telescope-symbols.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },

    -- View bookmarks in Telescope
    {
        'crusj/bookmarks.nvim',
        keys = {
            { '<tab><tab>', mode = { 'n' } },
        },
        branch = 'main',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('bookmarks').setup()
        end,
    },

    -- Tmux integration with Telescope
    'camgraff/telescope-tmux.nvim',
    {
        'gbirke/telescope-foldmarkers.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },

    -- Browse through rails project
    'sato-s/telescope-rails.nvim',

    -- Manage docker with Telescope
    'lpoto/telescope-docker.nvim',

    -- Hop around with Telescope
    'nvim-telescope/telescope-hop.nvim',

    -- Cheatsheet
    {
        'doctorfree/cheatsheet.nvim',
        event = 'VeryLazy',
        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        },
        config = function()
            local ctactions = require('cheatsheet.telescope.actions')
            require('cheatsheet').setup({
                bundled_cheetsheets = {
                    enabled = { 'default', 'lua', 'markdown', 'regex', 'netrw', 'unicode' },
                    disabled = { 'nerd-fonts' },
                },
                bundled_plugin_cheatsheets = {
                    enabled = {
                        'auto-session',
                        'goto-preview',
                        'octo.nvim',
                        'telescope.nvim',
                        'vim-easy-align',
                        'vim-sandwich',
                    },
                    disabled = { 'gitsigns' },
                },
                include_only_installed_plugins = true,
                telescope_mappings = {
                    ['<CR>'] = ctactions.select_or_fill_commandline,
                    ['<A-CR>'] = ctactions.select_or_execute,
                    ['<C-Y>'] = ctactions.copy_cheat_value,
                    ['<C-E>'] = ctactions.edit_user_cheatsheet,
                },
            })
        end,
    },

    -- Move through documente headers
    'crispgm/telescope-heading.nvim',

    -- Search emojis
    'xiyaowong/telescope-emoji.nvim',

    -- Search LSP handlers
    'gbrlsnchs/telescope-lsp-handlers.nvim',

    -- Investigate HTTTP Status Codes
    {
        'barrett-ruth/http-codes.nvim',
        config = true,
        -- or 'nvim-telescope/telescope.nvim'
        dependencies = 'ibhagwan/fzf-lua',
        keys = { { '<leader>H', '<cmd>HTTPCodes<cr>' } },
    },

    -- Integrate dap with Telescope
    'nvim-telescope/telescope-dap.nvim',
}
