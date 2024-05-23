return {
    -- My plugins here
    {
        '2kabhishek/nerdy.nvim',
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
    },
    'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
    'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
    'alvan/vim-closetag', -- Autocloses tags
    'windwp/nvim-autopairs',
    {
        'goolord/alpha-nvim',
        config = function()
            require('alpha').setup(require('alpha.themes.dashboard').config)
        end,
    }, -- Start screen
    'lewis6991/gitsigns.nvim', -- Git symbols
    {
        'willothy/nvim-cokeline',
        dependencies = {
            'nvim-lua/plenary.nvim', -- Required for v0.4.0+
            'kyazdani42/nvim-web-devicons', -- If you want devicons
        },
    },
    {
        'folke/persistence.nvim',
        event = 'BufReadPre', -- this will only start session saving when an actual file was opened
        module = 'persistence',
        config = function()
            require('persistence').setup()
        end,
    }, -- Session manager
    'kyazdani42/nvim-web-devicons', -- Icons
    'moll/vim-bbye',
    { 'nvim-lualine/lualine.nvim', dependencies = { 'kyazdani42/nvim-web-devicons', opt = true } },
    'tamton-aquib/staline.nvim', -- Status line and buffer line
    'norcalli/nvim-colorizer.lua', -- Color codes preview
    'lukas-reineke/indent-blankline.nvim',
    'HiPhish/rainbow-delimiters.nvim',
    { 'nvim-tree/nvim-tree.lua', dependencies = 'nvim-tree/nvim-web-devicons' }, -- File Tree
    'euclio/vim-markdown-composer',

    -- Color themes
    { 'rebelot/kanagawa.nvim', lazy = true },
    { 'olimorris/onedarkpro.nvim', lazy = true },
    { 'folke/tokyonight.nvim', lazy = true },
    {
        'catppuccin/nvim',
        dependencies = {
            {
                'mawkler/modicator.nvim',
                config = function()
                    require('modicator').setup({
                        show_warnings = false,
                        highlights = {
                            italic = true,
                        },
                    })
                end,
            },
        },
        lazy = true,
    },
    { 'EdenEast/nightfox.nvim', lazy = true },
    { 'bluz71/vim-moonfly-colors', lazy = true },
    { 'savq/melange-nvim', lazy = true },
    { 'Mofiqul/dracula.nvim', lazy = true },
    { 'tiagovla/tokyodark.nvim', lazy = true },

    -- CMP
    'hrsh7th/cmp-buffer', -- CMP buffer
    'hrsh7th/cmp-path', -- CMP paths
    'hrsh7th/cmp-cmdline', -- CMP completions
    'hrsh7th/nvim-cmp', -- CMP main plugin
    'saadparwaiz1/cmp_luasnip', -- snippet completions
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',

    -- Snippets
    'L3MON4D3/LuaSnip', --snippet engine
    'rafamadriz/friendly-snippets', -- a bunch of snippets to use

    -- LSP
    'neovim/nvim-lspconfig', -- enable LSP
    'williamboman/mason.nvim', -- simple to use language server installer
    'williamboman/mason-lspconfig.nvim', -- simple to use language server installer
    'nvimtools/none-ls.nvim', -- LSP diagnostics and code actions

    -- Misc
    'andweeb/presence.nvim', -- Discord integration
    'stevearc/dressing.nvim', -- Better UI
    {
        'smoka7/multicursors.nvim',
        dependencies = {
            'smoka7/hydra.nvim',
        },
    },
    'niuiic/core.nvim',
    {
        'ziontee113/icon-picker.nvim',
        config = function()
            require('icon-picker').setup({
                disable_legacy_commands = true,
            })
        end,
        opt = 'true',
    },
    {
        'epwalsh/obsidian.nvim',
        dependencies = {
            -- Required.
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-cmp',
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('obsidian').setup({
                dir = '~/my-vault',
            })
        end,
    },
    {
        'code-biscuits/nvim-biscuits',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
        },
    },
    'echasnovski/mini.nvim',
    --Clojure
    'clojure-vim/acid.nvim',
    'Vigemus/impromptu.nvim',
    'clojure-vim/jazz.nvim',

    -- Telescope
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-media-files.nvim',

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },

    -- Tmux integration
    'christoomey/vim-tmux-navigator',

    -- Mason installer utility to ensure installed LSP's
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } }, -- Configs for DAP
    'jay-babu/mason-nvim-dap.nvim', -- Better integration for Mason and nvim-dap
    'jay-babu/mason-null-ls.nvim',

    'mbbill/undotree',
    'tidalcycles/vim-tidal',

    'neomake/neomake',

    'tpope/vim-fugitive', -- Git commands
    'tpope/vim-sleuth', -- Adjust shiftwidth and expantab based on current file

    -- Edit and review GitHub issues and pr's
    {
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('octo').setup({
                suppress_missing_scope = {
                    projects_v2 = true,
                },
            })
        end,
    },

    -- Show code context for large functions
    'nvim-treesitter/nvim-treesitter-context',

    -- Take shots of code
    {
        'niuiic/code-shot.nvim',
        require = {
            'niuiic/core.nvim',
        },
    },

    -- Run blocks of code
    { 'michaelb/sniprun', build = 'sh ./install.sh' },

    -- Smart commenting
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },

    -- OrgMode
    {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup({})
        end,
    },
    -- Add utf-8 bullet points
    {
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup()
        end,
    },
    -- Highlights for markdown orgmode and neorg
    -- Create tables
    'dhruvasagar/vim-table-mode',
    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    'habamax/vim-godot', -- Godot integration
    'uga-rosa/ccc.nvim', -- Color picker
    'https://git.sr.ht/~detegr/nvim-bqn', -- BQN utilities
    'xiyaowong/link-visitor.nvim', -- Visit links in a file
    {
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup()
        end,
    }, -- File explorer with editing capabilities
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = 'Neotree',
        keys = {
            { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = 'NeoTree ' },
        },
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
        },
    }, -- File tree
    'rebelot/heirline.nvim', -- Status, window and tabline
    'folke/twilight.nvim', -- Dim parts of the code you're not working on
    {
        'folke/zen-mode.nvim',
        --init = require('zen-mode').setup({
        --    window = {
        --        backdrop = 1,
        --    },
        --    plugins = {
        --        twilight = {
        --            enabled = true,
        --        },
        --        tmux = {
        --            enabled = true,
        --        },
        --        kitty = {
        --            enabled = true,
        --            font = '+10', -- font size increment
        --        },
        --        gitsigns = {
        --            enabled = true,
        --        },
        --    },
        --}),
    },
    'bellinitte/uxntal.vim',
    'windwp/nvim-ts-autotag',
    'jvgrootveld/telescope-zoxide',
    'nanotee/zoxide.vim',
    {
        'ckolkey/ts-node-action',
        dependencies = { 'nvim-treesitter' },
        config = function()
            require('ts-node-action').setup({})
        end,
    },
    'tomasky/bookmarks.nvim',
}
