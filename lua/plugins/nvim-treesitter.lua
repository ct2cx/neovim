return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'master',
	main = 'nvim-treesitter.configs',
	lazy = false,
	build = ':TSUpdate',
	opts = {
		ensure_installed = { 
			'c', 'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
			'tmux', 'fish', 'bash'
		},
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = { enable = true }
	}
}
