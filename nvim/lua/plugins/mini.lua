return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            local MiniMap = require('mini.map')
            local MiniAI = require('mini.ai')

            require('mini.animate').setup()
            require('mini.cursorword').setup()
            require('mini.surround').setup()
            require('mini.basics').setup()
            require('mini.splitjoin').setup()

            MiniAI.setup()

            require('mini.move').setup()
            require('mini.operators').setup()
            require('mini.trailspace').setup()

            MiniMap.setup({
                symbols = {
                    encode = MiniMap.gen_encode_symbols.dot('2x1'),
                    scroll_line = ' ',
                },
                window = {
                    winblend = 70,
                    zindex = 100
                }
            })
            vim.api.nvim_set_keymap('n', '<C-m>', '<cmd>lua require("mini.map").toggle()<cr>', {silent = true, noremap = true})

            require('mini.comment').setup()
            require('mini.sessions').setup()
        end,
    },
}
