return {
	'rebelot/heirline.nvim',
	config = function()
		local plugconf = require('plugconfs.heirline.doom')
		local utils = require('heirline.utils')

		vim.api.nvim_create_augroup('Heirline', { clear = true })
		vim.api.nvim_create_autocmd('ColorScheme', {
			callback = function()
				utils.on_colorscheme(plugconf:get_colors())
			end,
			group = 'Heirline'
		})

		require('heirline').setup {
			opts = {
				colors = plugconf:get_colors()
			},
			statusline = plugconf:get_statusline(),
		}
	end
}
