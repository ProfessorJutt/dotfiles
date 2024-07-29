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

-- Snippets be eating tab keys like they cookies.
api.nvim_create_autocmd("ModeChanged", {
	pattern = "*",
	callback = function()
		if
			((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
			and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require("luasnip").session.jump_active
		then
			require("luasnip").unlink_current()
		end
	end,
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
