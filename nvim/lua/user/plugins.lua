local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    print('Installing packer close and reopen Neovim...')
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use('wbthomason/packer.nvim') -- Have packer manage itself
    use('nvim-lua/popup.nvim')    -- An implementation of the Popup API from vim in Neovim
    use('nvim-lua/plenary.nvim')  -- Useful lua functions used ny lots of plugins
    use('alvan/vim-closetag')     -- Autocloses tags
    use('sheerun/vim-polyglot')
    use('windwp/nvim-autopairs')
    use({
        'goolord/alpha-nvim',
        config = function()
            require('alpha').setup(require('alpha.themes.dashboard').config)
        end,
    })                             -- Start screen
    use('lewis6991/gitsigns.nvim') -- Git symbols
    use({
        'willothy/nvim-cokeline',
        requires = {
            'nvim-lua/plenary.nvim',        -- Required for v0.4.0+
            'kyazdani42/nvim-web-devicons', -- If you want devicons
        },
    })
    use({
        'folke/persistence.nvim',
        event = 'BufReadPre', -- this will only start session saving when an actual file was opened
        module = 'persistence',
        config = function()
            require('persistence').setup()
        end,
    })                                  -- Session manager
    use('kyazdani42/nvim-web-devicons') -- Icons
    use('moll/vim-bbye')
    use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } })
    use('tamton-aquib/staline.nvim')   -- Status line and buffer line
    use('norcalli/nvim-colorizer.lua') -- Color codes preview
    use('lukas-reineke/indent-blankline.nvim')
    use('HiPhish/rainbow-delimiters.nvim')
    use({ 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }) -- File Tree
    use('euclio/vim-markdown-composer')

    -- Color themes
    use('rebelot/kanagawa.nvim')
    use('olimorris/onedarkpro.nvim')
    use('folke/tokyonight.nvim')
    use('catppuccin/nvim')
    use('EdenEast/nightfox.nvim')
    use('bluz71/vim-moonfly-colors')
    use('savq/melange-nvim')
    use('Mofiqul/dracula.nvim')
    use('tiagovla/tokyodark.nvim')

    -- CMP
    use('hrsh7th/cmp-buffer')       -- CMP buffer
    use('hrsh7th/cmp-path')         -- CMP paths
    use('hrsh7th/cmp-cmdline')      -- CMP completions
    use('hrsh7th/nvim-cmp')         -- CMP main plugin
    use('saadparwaiz1/cmp_luasnip') -- snippet completions
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lua')

    -- Snippets
    use('L3MON4D3/LuaSnip')             --snippet engine
    use('rafamadriz/friendly-snippets') -- a bunch of snippets to use

    -- LSP
    use('neovim/nvim-lspconfig')             -- enable LSP
    use('williamboman/mason.nvim')           -- simple to use language server installer
    use('williamboman/mason-lspconfig.nvim') -- simple to use language server installer
    use('nvimtools/none-ls.nvim')            -- LSP diagnostics and code actions

    -- Misc
    use('andweeb/presence.nvim')  -- Discord integration
    use('stevearc/dressing.nvim') -- Better UI
    use({
        'smoka7/multicursors.nvim',
        requires = {
            'smoka7/hydra.nvim',
        },
    })
    use({
        'samodostal/image.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    })
    use('niuiic/core.nvim')
    use({
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function()
            require('toggleterm').setup()
        end,
    })
    use({
        'mawkler/modicator.nvim',
        after = 'onedarkpro.nvim', -- Add your colorscheme plugin here
        config = function()
            require('modicator').setup({
                show_warnings = false,
                highlights = {
                    italic = true,
                },
            })
        end,
    })
    use({
        'ziontee113/icon-picker.nvim',
        config = function()
            require('icon-picker').setup({
                disable_legacy_commands = true,
            })
        end,
        opt = 'true',
    })
    use({
        'epwalsh/obsidian.nvim',
        requires = {
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
    })
    use({
        'code-biscuits/nvim-biscuits',
        requires = {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
        },
    })
    use('echasnovski/mini.nvim')
    --Clojure
    use('clojure-vim/acid.nvim')
    use('Vigemus/impromptu.nvim')
    use('clojure-vim/jazz.nvim')

    -- Telescope
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-media-files.nvim')

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    })
    use({
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter',
    })

    -- Tmux integration
    use('christoomey/vim-tmux-navigator')

    -- Mason installer utility to ensure installed LSP's
    use('WhoIsSethDaniel/mason-tool-installer.nvim')
    use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }) -- Configs for DAP
    use('jay-babu/mason-nvim-dap.nvim')                                     -- Better integration for Mason and nvim-dap
    use('jay-babu/mason-null-ls.nvim')

    use('mbbill/undotree')
    use('tidalcycles/vim-tidal')

    use('neomake/neomake')

    use('tpope/vim-fugitive') -- Git commands
    use('tpope/vim-sleuth')   -- Adjust shiftwidth and expantab based on current file

    -- Edit and review GitHub issues and pr's
    use({
        'pwntester/octo.nvim',
        requires = {
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
    })

    -- Show code context for large functions
    use('nvim-treesitter/nvim-treesitter-context')

    -- Take shots of code
    use({
        'niuiic/code-shot.nvim',
        require = {
            'niuiic/core.nvim',
        },
    })

    -- Run blocks of code
    use({ 'michaelb/sniprun', run = 'sudo sh ./install.sh' })

    -- Smart commenting
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    })

    -- OrgMode
    use({
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup({})
        end,
    })
    -- Add utf-8 bullet points
    use({
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup()
        end,
    })
    -- Highlights for markdown orgmode and neorg
    use({
        'lukas-reineke/headlines.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('headlines').setup()
        end,
    })
    -- Create tables
    use('dhruvasagar/vim-table-mode')
    use({
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
    })
    use('habamax/vim-godot')                  -- Godot integration
    use('uga-rosa/ccc.nvim')                  -- Color picker
    use('https://git.sr.ht/~detegr/nvim-bqn') -- BQN utilities
    use('xiyaowong/link-visitor.nvim')        -- Visit links in a file
    use({
        'stevearc/oil.nvim',
        config = function()
            require('oil').setup()
        end,
    }) -- File explorer with editing capabilities
    use({
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
    })                           -- File tree
    use('rebelot/heirline.nvim') -- Status, window and tabline
    use('folke/twilight.nvim')   -- Dim parts of the code you're not working on
    use({
        'folke/zen-mode.nvim',
        setup = require('zen-mode').setup({
            window = {
                backdrop = 1,
            },
            plugins = {
                twilight = {
                    enabled = true,
                },
                tmux = {
                    enabled = true,
                },
                kitty = {
                    enabled = true,
                    font = '+10', -- font size increment
                },
                gitsigns = {
                    enabled = true,
                },
            },
        }),
    })
    use('bellinitte/uxntal.vim')
    use('windwp/nvim-ts-autotag')
    use({
        'kylechui/nvim-surround',
        tag = '*', -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })
    use('jvgrootveld/telescope-zoxide')
    use('nanotee/zoxide.vim')
    use({
        'ckolkey/ts-node-action',
        requires = { 'nvim-treesitter' },
        config = function()
            require('ts-node-action').setup({})
        end,
    })
    use({
        'tomasky/bookmarks.nvim',
    })
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').update()
    end
end)
