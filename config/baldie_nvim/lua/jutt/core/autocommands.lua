local api = vim.api

local function augroup(name)
	return api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- New lines while commenting are not comments themselves
api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = augroup("commentline"),
	desc = "Disable New Line Comment",
})

-- Refresh Lualine for macros
api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		require("lualine").refresh({
			place = { "statusline" },
		})
	end,
})

-- Highlight them yankies
api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})
