return {
    -- Snippets
    -- Snippet engine
    {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end
    },

    -- a bunch of snippets to use
    'rafamadriz/friendly-snippets',

    -- Clojure
    'clojure-vim/acid.nvim',
    'Vigemus/impromptu.nvim',
    'clojure-vim/jazz.nvim',

    -- Tidalcycles
    'tidalcycles/vim-tidal',

    -- Better make
    'neomake/neomake',

    -- Run blocks of code
    { 'michaelb/sniprun',   build = 'sh ./install.sh 1' },

    -- Godot integration
    'habamax/vim-godot',

    -- BQN utilities
    'https://git.sr.ht/~detegr/nvim-bqn',

    -- UXN
    'bellinitte/uxntal.vim',

    -- Utilities for C# programming
    {
        'iabdelkareem/csharp.nvim',
        dependencies = {
            'williamboman/mason.nvim', -- Required, automatically installs omnisharp
            'mfussenegger/nvim-dap',
            'Tastyep/structlog.nvim',  -- Optional, but highly recommended for debugging
        },
        config = true,
    },

    -- Utilities for Java
    {
        'simaxme/java.nvim',
        dependencies = {
            'mfussenegger/nvim-jdtls',
            'nvim-tree/nvim-tree.lua',
            'L3MON4D3/LuaSnip',
        },
        config = true,
    },

    -- Helper for competitive programming
    { 'p00f/cphelper.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Solve leetcode problems from nvim
    {
        'kawre/leetcode.nvim',
        build = ':TSUpdate html',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim', -- required by telescope
            'MunifTanjim/nui.nvim',

            -- optional
            'nvim-treesitter/nvim-treesitter',
            'rcarriga/nvim-notify',
            'nvim-tree/nvim-web-devicons',
        },
    },

    -- Convert strings into f strings and other
    {
        'chrisgrieser/nvim-puppeteer',
        lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
    },

    -- Swap binary operands and operators
    {
        'Wansmer/binary-swap.nvim',
        config = function()
            vim.keymap.set('n', '<M-s>', function()
                require('binary-swap').swap_operands()
            end)
            vim.keymap.set('n', '<M-S>', function()
                require('binary-swap').swap_operands_with_operator()
            end)
        end,
    },

    -- Make test from nvim
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'nvim-lua/plenary.nvim',
            'antoinemadec/FixCursorHold.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
    },

    -- Supercollider
    'davidgranstrom/scnvim',

    -- Haskell
    {
        'mrcjkb/haskell-tools.nvim',
        version = '^3', -- Recommended
        lazy = false,   -- This plugin is already lazy
    },

    {
        'mrcjkb/haskell-snippets.nvim',
        config = function()
            local ls = require('luasnip')
            ls.setup()

            local haskell_snippets = require('haskell-snippets').all
            ls.add_snippets('haskell', haskell_snippets, { key = 'haskell' })
        end,
    },

    -- Misc Snippets
    { 'rafamadriz/friendly-snippets' },
}
