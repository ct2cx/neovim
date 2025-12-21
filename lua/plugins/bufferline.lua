return {
	'akinsho/bufferline.nvim',
	config = function()
		require('bufferline').setup {
			options = {
				show_buffer_close_icons = false,
				close_icon = '',
				modified_icon = '',
				left_trunc_marker = '󰧘',
				right_trunc_marker = '󰧚',
				tab_size = 20,
				style_preset = {
					require('bufferline').style_preset.no_italic,
					require('bufferline').style_preset.no_bold,
				},
				show_buffer_icons = false,
				separator_style = { '', '' },
				indicator = { style = 'none' },
				offsets = {
					{
						filetype = 'NvimTree',
						text = '',
						separator = false,
					}
				},
				name_formatter = function(buf)
					if buf.name == "" or buf.name == "[No Name]" then
						return "*scratch*"
					end
					return buf.name
				end,
			},
		}
	end
}
