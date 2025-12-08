local utils = require('heirline.utils')
local M = {}

M.align = { provider = '%=' }
M.spacing = { provider = string.rep(' ', 3) }

M.vimode_block = {
	init = function(self)
		self.current_mode = vim.fn.mode(0)
	end,
	static = {
		mode_stat = {
			i = 'INSERT',
			n = 'NORMAL',
			v = 'VISUAL',
			V = 'V-LINE',
			['\22'] = 'V-BLOCK',
			s = 'SELECT',
			S  = 'S-LINE',
			R = 'REPLACE',
			c = 'COMMAND',
			t = 'TERMINAL'
		},
		mode_colors = {
			i = 'green',
			n = 'blue',
			v = 'yellow',
			V = 'yellow',
			['\22'] = 'yellow',
			s = 'color2',
			S = 'color2',
			R = 'color2',
			c = 'red',
			t = 'color3'
		}
	},
	update = {
		'ModeChanged',
		pattern = '*:*',
		callback = vim.schedule_wrap(function()
			vim.cmd('redrawstatus')
		end)
	}
}

M.mode = {
	provider = function(self)
		local mode = '󰄯'
		if mode == nil then
			return mode
		else
			return ' ' .. mode
		end
	end,
	hl = function(self)
		return { fg = self.mode_colors[self.current_mode] }
	end
}

M.file_block = {
	init = function(self)
		self.parent = vim.fn.expand('%:p:h:t')
		self.file = vim.fn.expand('%:t')
		self.ro = vim.bo.readonly
		self.modified = vim.bo.modified
		self.ext = vim.fn.expand('%:e')
	end,
}

M.file_icon = {
	init = function(self)
		if self.file == 'NvimTree_1' then
			self.icon = '󰝰'
		else
			self.icon, self.color = require('nvim-web-devicons').get_icon_color(self.file, self.ext, {default=true})
		end
	end,
	provider = function(self)
		return self.icon .. ' '
	end,
}

M.file_name = {
	provider = function(self)
		local file = self.file
		if file == 'NvimTree_1' then
			file = 'NvimTree'
		elseif file ~= '' then
			file = self.file
		else
			file = '*scratch*'
		end
		if self.ro then
			file = file .. ' [%%]'
		elseif self.modified then
			file =  file .. ' [+]'
		end
		return file
	end
}

M.dir_block = {
	provider = function(self)
		return '󰝰 '
	end,
	hl = { fg = 'color1' }
}

M.curr_dir = {
	provider = function(self)
		return self.parent
	end,
	hl = { fg = M.dir_block.hl.fg }
}

M.line_nr = {
	provider = function(self)
		return '%l:%c '
	end,
}

M.line_percent = {
	provider = function(self)
		local total = vim.fn.line('$')
		local current = vim.fn.line('.')
		if current == 1 then
			return '0%%'
		else
			return string.format(" %.0f%%%% ", current/total*100)
		end
	end,
}

M.macro_block = {
	condition = function(self) return vim.fn.reg_recording() ~= '' end,
	init = function(self)
		self.key = vim.fn.reg_recording()
	end,
	provider = function(self)
		return '󰌌 '
	end,
	hl = { fg = 'yellow' }
}

M.macro_status = {
	provider = function(self)
		return self.key
	end,
	hl = { fg = M.macro_block.hl.fg }
}

M.file_size = {
	provider = function(self)
		local fsize = vim.fn.getfsize(vim.fn.expand('%'))  -- in bytes
		local c = 1
		local units = { '', 'k', 'M', 'G', 'T', 'P', 'E' }
		if fsize <= 0 then
			return '--'
		end
		while fsize > 1024 do
			fsize = fsize / 1024
			c = c + 1
		end
		if c == 1 then
			fsize = string.format('%.f', fsize)
		else
			fsize = string.format('%.1f', fsize)
		end
		return string.format('%s%s', fsize, units[c])
	end
}

function M:get_colors()
	return {
		fg = utils.get_highlight('Normal').fg,
		bg = utils.get_highlight('Normal').bg,
		green = utils.get_highlight('DiagnosticOk').fg,
		blue = utils.get_highlight('DiagnosticInfo').fg,
		yellow = utils.get_highlight('DiagnosticWarn').fg,
		red = utils.get_highlight('DiagnosticError').fg,
		gray = utils.get_highlight('Visual').bg,
		color1 = utils.get_highlight('Boolean').fg,
		color2 = utils.get_highlight('Label').fg,
		color3 = utils.get_highlight('Macro').fg
	}
end

function M:get_statusline()
	return { hl = { bg = 'bg', fg = 'fg' },
		utils.insert(self.vimode_block, self.mode),
		self.spacing, self.file_size,
		self.spacing, utils.insert(self.file_block, self.file_icon, self.file_name),
		self.spacing, self.line_percent,
		self.align, utils.insert(self.macro_block, self.macro_status),
		self.spacing, utils.insert(self.file_block, self.dir_block, self.curr_dir),
		self.spacing, self.line_nr,
	}
end

return M
