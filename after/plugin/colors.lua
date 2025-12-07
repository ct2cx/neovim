local funcs = require('funcs')

-- Modification that would apply globally for any colorschemes
vim.api.nvim_create_augroup('AfterPlugin', { clear = false })
vim.api.nvim_create_autocmd('ColorScheme', {
	pattern = '*',
	callback = function(args)
		vim.api.nvim_set_hl(0, 'NormalFloat', { bg = funcs:get_hl('BufferVisible', 'bg') })
		vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { link = 'CursorLine' })
		vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = funcs:get_hl('Normal', 'bg') })
		vim.api.nvim_set_hl(0, 'BufferLineBackground', { fg = funcs:get_hl('StatuslineNC', 'fg'), bg = funcs:get_hl('Statusline', 'bg') })
		vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { link = 'Normal' })
		vim.api.nvim_set_hl(0, 'BufferLineBufferVisible', { link = 'Normal' })
		vim.api.nvim_set_hl(0, 'BufferLineFill', { link = 'Statusline' })
		vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator', { fg = funcs:get_hl('Normal', 'bg'), bg = funcs:get_hl('Normal', 'bg') })
		vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { link = 'BufferLineOffsetSeparator' })
		vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { link = 'BufferLineOffsetSeparator' })
		vim.api.nvim_set_hl(0, 'BufferLineTab', { fg = funcs:get_hl('Normal', 'fg'), bg = funcs:get_hl('Visual', 'bg') })
		vim.api.nvim_set_hl(0, 'BufferLineTabSelected', { fg = funcs:get_hl('Normal', 'bg'), bg = funcs:get_hl('DiagnosticInfo', 'fg') })
		vim.api.nvim_set_hl(0, 'BufferLineTabClose', { bg = funcs:get_hl('DiagnosticError', 'fg'), fg = funcs:get_hl('Normal', 'bg') })
		vim.api.nvim_set_hl(0, 'BufferLineModified', { link = 'BufferLineBackground' })
		vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', { link = 'Normal' })
		vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible', { link = 'Normal' })
		vim.api.nvim_set_hl(0, 'BufferLineDuplicate', { link = 'BufferLineBackground' })
		vim.api.nvim_set_hl(0, 'BufferLineDuplicateSelected', { fg = funcs:get_hl('Comment', 'fg'), bg = funcs:get_hl('Normal', 'bg') })
		vim.api.nvim_set_hl(0, 'BufferLineDuplicateVisible', { link = 'BufferLineDuplicateSelected' })
	end,
	group = 'AfterPlugin'
})

-- Specify you preferred colorscheme
vim.cmd.colorscheme('catppuccin')
