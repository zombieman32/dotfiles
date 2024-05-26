return {
    {
        'echasnovski/mini.nvim',
        verssion = false,
        config = function()
            local MiniMap = require('mini.map')

            require('mini.animate').setup()
            require('mini.cursorword').setup()
            require('mini.surround').setup()
            require('mini.basics').setup()
            require('mini.splitjoin').setup()
            require('mini.ai').setup()
            require('mini.move').setup()
            require('mini.operators').setup()
            require('mini.trailspace').setup()

            MiniMap.setup({
                symbols = {
                    encode = MiniMap.gen_encode_symbols.shade('2x1'),
                    scroll_line = ' ',
                },
                window = {
                    winblend = 50,
                    zindex = 100
                }
            })
            vim.api.nvim_set_keymap('n', '<C-m>', '<cmd>lua require("mini.map").toggle()<cr>', {silent = true, noremap = true})

            require('mini.comment').setup()
            require('mini.sessions').setup()
        end,
    },
}
