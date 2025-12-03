return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', opts = {} },
	opts = {
		default_file_explorer = true,
		columns = {
			'icon'
		},
		float = {
			padding = 2,
			max_width = 120
		}
	}
}
