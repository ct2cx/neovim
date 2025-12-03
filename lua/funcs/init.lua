local M = {}

function M:get_hl(group, type)
	return vim.api.nvim_get_hl(0, { name = group })[type]
end

return M
