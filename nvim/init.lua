-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1
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

require('lazy').setup('plugins', {
    git = {
        log = { -4 },
        timeout = 90,
    },
    ui = {
        size = { width = 0.9, height = 0.7 },
        border = 'rounded',
        backdrop = 80,
        title = 'lazy 󰒲 󰒲 󰒲 ',
        title_pos = 'left',
        icons = {
            cmd = ' ',
            config = '',
            event = '',
            ft = ' ',
            init = ' ',
            import = ' ',
            keys = ' ',
            lazy = '󰒲 ',
            loaded = '●',
            not_loaded = '○',
            plugin = ' ',
            runtime = ' ',
            require = '󰢱 ',
            source = ' ',
            start = ' ',
            task = '✔ ',
            list = {
                '●',
                '➜',
                '★',
                '‒',
            },
        },
    },
    checker = {
        enabled = true,
        frequency = 86400,
    },
})

require('options')
require('keymaps')
require('plugins.lsp.handlers')
require('autocmd')
require('bqnlsp')
require('bqnparser')

local mocha = require('catppuccin.palettes').get_palette('mocha')

vim.api.nvim_set_hl(0, 'NormalMode', { fg = mocha.blue, bold = true })
vim.api.nvim_set_hl(0, 'InsertMode', { fg = mocha.green, bold = true })
vim.api.nvim_set_hl(0, 'ReplaceMode', { fg = mocha.red, bold = true })
vim.api.nvim_set_hl(0, 'CommandMode', { fg = mocha.peach, bold = true })
vim.api.nvim_set_hl(0, 'VisualMode', { fg = mocha.mauve, bold = true })
