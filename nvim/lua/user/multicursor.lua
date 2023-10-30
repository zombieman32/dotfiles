local status_ok, multi = pcall(require, "multicursors")
if not status_ok then
  return
end

multi.setup({
    normal_keys = {
        -- to change default lhs of key mapping change the key
        ['<C-c>'] = {
            method = function()
                require('multicursors.utils').call_on_selections(function(selection)
                    vim.api.nvim_win_set_cursor(0, { selection.row + 1, selection.col + 1 })
                    local line_count = selection.end_row - selection.row + 1
                    vim.cmd('normal ' .. line_count .. 'gcc')
                end)
            end,
            opts = { desc = 'comment selections' },
        },
    },
    hint_config = {
        border = 'rounded',
        position = 'bottom-right',
    },
    generate_hints = {
        normal = true,
        insert = true,
        extend = true,
        config = {
            column_count = 1,
        },
    },
})
