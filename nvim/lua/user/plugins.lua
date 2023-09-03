local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "alvan/vim-closetag" -- Autocloses tags
  use 'sheerun/vim-polyglot'
  use "windwp/nvim-autopairs"
  use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  } -- Start screen
  use "lewis6991/gitsigns.nvim" -- Git symbols
  use({
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  module = "persistence",
  config = function()
    require("persistence").setup()
  end,}) -- Session manager
  use 'echasnovski/mini.animate' -- Animations
  use 'kyazdani42/nvim-web-devicons' -- Icons
  use "akinsho/bufferline.nvim" -- Tabs
  use "moll/vim-bbye"
  use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use 'junegunn/rainbow_parentheses.vim' -- Color pairs of brackets
  use "norcalli/nvim-colorizer.lua" -- Color codes preview
  use "lukas-reineke/indent-blankline.nvim" -- Indent guides
  use {'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons'} -- File Tree
  use 'iamcco/markdown-preview.nvim'

  -- Color themes
  use 'rebelot/kanagawa.nvim'
  use 'olimorris/onedarkpro.nvim'
  use "folke/tokyonight.nvim"
  use "catppuccin/nvim"
  use "EdenEast/nightfox.nvim"
  use 'bluz71/vim-moonfly-colors'
  use 'savq/melange-nvim'
  use "AlphaTechnolog/onedarker.nvim"
  use "Mofiqul/dracula.nvim"
  use "tiagovla/tokyodark.nvim"

  -- CMP
  use 'hrsh7th/cmp-buffer' -- CMP buffer
  use 'hrsh7th/cmp-path' -- CMP paths
  use 'hrsh7th/cmp-cmdline' -- CMP completions
  use 'hrsh7th/nvim-cmp' -- CMP main plugin
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- LSP diagnostics and code actions

  -- Misc
  use "mg979/vim-visual-multi" -- Multiple cursors
  use 'echasnovski/mini.cursorword'
  use "stevearc/dressing.nvim"

  use{
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup{
        disable_legacy_commands = true
      }
    end,
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  --Tmux integration
  use "christoomey/vim-tmux-navigator"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
