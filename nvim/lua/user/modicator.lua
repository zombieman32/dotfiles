local status_ok, modicator = pcall(require, "modicator")
if not status_ok then
	return
end

vim.api.nvim_set_hl(0, 'NormalMode', {fg = "#ff78c5", italic = true})

modicator.setup({
      highlights = {
        -- Default options for bold/italic
        defaults = {
          italic = true
        },
      },
    })
