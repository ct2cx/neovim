return {
	{
		'rose-pine/neovim', name = 'rose-pine', priority = 1000
	},
	{
		'catppuccin/nvim', name = 'catppuccin', priority = 1000
	},
	{
		'sainnhe/gruvbox-material',
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.g.gruvbox_material_foreground = 'original'
			-- vim.g.gruvbox_material_background = 'hard'
			-- vim.g.gruvbox_material_enable_italic = 1
			-- vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_enable_italic = 1
			-- vim.g.gruvbox_material_enable_bold = 1
			-- vim.g.gruvbox_material_transparent_background = 1
		end
	},
}
