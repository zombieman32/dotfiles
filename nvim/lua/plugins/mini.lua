return {
    {
        'echasnovski/mini.nvim',
        verssion = false,
        config = function()
            require('mini.animate').setup()
            require('mini.cursorword').setup()
            require('mini.surround').setup()
            require('mini.basics').setup()
            require('mini.splitjoin').setup()
            require('mini.ai').setup()
            require('mini.move').setup()
            require('mini.operators').setup()
            require('mini.trailspace').setup()
            require('mini.map').setup()
            require('mini.comment').setup()
            require('mini.sessions').setup()
        end,
    },
}
