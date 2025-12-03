local funcs = require('funcs')
return {
	{
		'sainnhe/gruvbox-material',
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function()
			-- vim.g.gruvbox_material_foreground = 'original'
			-- vim.g.gruvbox_material_background = 'hard'
			vim.g.gruvbox_material_enable_italic = 1
			-- vim.g.gruvbox_material_enable_bold = 1
			-- vim.g.gruvbox_material_transparent_background = 1
			vim.api.nvim_create_augroup('GruvboxMaterial', {clear = true})
			vim.api.nvim_create_autocmd('ColorScheme', {
				pattern = 'gruvbox-material',
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
					vim.api.nvim_set_hl(0, 'BufferLineDuplicate', { link = 'BufferLineBackground' })
					vim.api.nvim_set_hl(0, 'BufferLineModified', { link = 'BufferLineBackground' })
					vim.api.nvim_set_hl(0, 'BufferLineModifiedSelected', { link = 'Normal' })
					vim.api.nvim_set_hl(0, 'BufferLineModifiedVisible', { link = 'Normal' })
					vim.api.nvim_set_hl(0, 'BufferLineDuplicateVisible', { link = 'BufferLineDuplicateSelected' })
				end,
				group = 'GruvboxMaterial'
			})
			vim.cmd.colorscheme 'gruvbox-material'
		end
	},
}
