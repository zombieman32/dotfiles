local status_ok, codeshot = pcall(require, "code-shot")
if not status_ok then
	return
end

codeshot.setup({
	output = function()
		local core = require("core")
		local buf_name = vim.api.nvim_buf_get_name(0)
		return core.file.name(buf_name) .. ".png"
	end,
	options = function(select_area)
		if not select_area then
			return {}
		end
		return {
			"--line-offset",
			select_area.s_start.row,
		}
	end,
})
