return {
	'nvim-treesitter/nvim-treesitter',
	version = false,
	main = 'nvim-treesitter.configs',
	lazy = false,
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 
			'c', 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
			'qmljs', 'qmldir', 'tmux', 'json', 'jsonc', 'kdl', 'fish',
			'yaml', 'fennel', 'bash'
		},
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true }
	}
}
