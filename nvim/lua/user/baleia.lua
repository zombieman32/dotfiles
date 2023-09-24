local status_ok, baleia = pcall(require, "baleia")
if not status_ok then
	return
end

local color = baleia.setup({

})

function BaleiaColorize()
    color.once(vim.fn.bufnr('%'))
end
vim.cmd('command! BaleiaColorize call v:lua.BaleiaColorize()')
