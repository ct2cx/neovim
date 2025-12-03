return {
	'rcarriga/nvim-notify',
	config = function()
		require('notify').setup {
			fps = 60,
			render = 'wrapped-compact',
			stages = 'slide',
			icons = {
				DEBUG = ' ',
				ERROR = ' ',
				INFO = ' ',
				TRACE = ' ',
				WARN = ' '
			}
		}
		vim.notify = require("notify")
	end
}
