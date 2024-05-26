return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'polirritmico/telescope-lazy-plugins.nvim' },
        },
        config = function()
            local telescope = require('telescope')

            telescope.load_extension('media_files')
            telescope.load_extension('bookmarks')
            telescope.load_extension('nerdy')
            telescope.load_extension('telescope-tabs')
            telescope.load_extension('undo')
            telescope.load_extension('lazy_plugins')

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
                },
            })
        end,
    },
    {
        'jvgrootveld/telescope-zoxide',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
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
    {
        'nvim-telescope/telescope-media-files.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
    {
        'LukasPietzschmann/telescope-tabs',
        config = function()
            require('telescope-tabs').setup({
                -- Your custom config :^)
            })
        end,
        dependencies = { 'nvim-telescope/telescope.nvim' },
    },
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
}
