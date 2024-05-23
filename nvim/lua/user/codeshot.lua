local status_ok, codeshot = pcall(require, 'code-shot')
if not status_ok then
    return
end

codeshot.setup({
    output = function()
        local core = require('core')
        local buf_name = vim.api.nvim_buf_get_name(0)
        return '/hdd/Imágenes/Codeshot' .. core.file.name(buf_name) .. '.png'
    end,
    options = function(select_area)
        if not select_area then
            return {
                '--shadow-blur-radius',
                '5',
                '--no-line-number',
                '--theme',
                'OneHalfDark',
                '--font',
                'Fira Code',
                '--line-pad',
                '4',
            }
        end
        return {
            '--shadow-blur-radius',
            '5',
            '--line-offset',
            select_area.s_start.row,
            '--no-line-number',
            '--theme',
            'OneHalfDark',
            '--font',
            'Fira Code',
            '--line-pad',
            '4',
        }
    end,
})
