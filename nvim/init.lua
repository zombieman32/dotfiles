-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_use_noswf = 0
vim.g.number = 1
vim.g.mapleader = ','
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('user.plugins', {
    defaults = {
        lazy = true,
    },
    ui = {
        border = 'rounded',
    },
})
require('user.options')
require('user.keymaps')
require('user.colorscheme')
require('user.nvimtree')
require('user.cmp')
require('user.lsp')
require('user.cokeline')
require('user.lualine')
require('user.telescope')
require('user.image')
require('user.treesitter')
require('user.autopairs')
require('user.gitsigns')
require('user.alpha')
require('user.biscuits')
require('user.toggleterm')
require('user.masonti')
require('user.multicursor')
require('user.codeshot')
require('user.regs')
require('user.whichkey')
require('user.autocmd')
require('user.bqnlsp')
require('user.bqnparser')
require('lspconfig').gdscript.setup({})
require('user.linkvisitor')
require('user.mini')
require('user.null')
require('user.nvim-ts-autotag')
require('user.indent')
require('user.catppuccin')
require('user.octo')
require('user.pretty-fold')

local mocha = require('catppuccin.palettes').get_palette('mocha')
vim.api.nvim_set_hl(0, 'NormalMode', { fg = mocha.blue, bold = true })
vim.api.nvim_set_hl(0, 'InsertMode', { fg = mocha.green, bold = true })
vim.api.nvim_set_hl(0, 'ReplaceMode', { fg = mocha.red, bold = true })
vim.api.nvim_set_hl(0, 'CommandMode', { fg = mocha.peach, bold = true })
vim.api.nvim_set_hl(0, 'VisualMode', { fg = mocha.mauve, bold = true })
