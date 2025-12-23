vim.api.nvim_create_autocmd('FileType', {
	pattern = 'man',
	callback = function()
		vim.wo.number = true
		vim.wo.relativenumber = true
	end
})
