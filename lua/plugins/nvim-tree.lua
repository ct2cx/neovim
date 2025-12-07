return {
	'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		hijack_cursor = true,
		hijack_netrw = false,
		update_focused_file = {
			enable = true
		},
		renderer = {
			root_folder_label = false,
			indent_markers = {
				enable = false
			},
			icons = {
				padding = {
					icon = ' ',
					folder_arrow = ' '
				},
				symlink_arrow = ' 󰁔 ',
				glyphs = {
					default = "",
					symlink = "",
					bookmark = "",
					modified = "",
					hidden = "󰊠",
					folder = {
						arrow_closed = "󰅂",
						arrow_open = "󰅀",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "",
						staged = "",
						unmerged = "",
						renamed = "",
						untracked = "󰩳",
						deleted = "",
						ignored = "󰈉"
					}
				}
			}
		}
	}
}
