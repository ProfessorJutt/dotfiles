return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"f-person/git-blame.nvim",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		local git_blame = require("gitblame")

		-- This disables showing of the blame text next to the cursor
		vim.g.gitblame_display_virtual_text = 0

		lualine.setup({
			options = {
				theme = "onedark",
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "neo-tree" } },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = { "branch" },
				lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "filetype" },
				},
				lualine_y = {
					function()
						local reg = vim.fn.reg_recording()
						if reg == "" then
							return os.date("%I:%M:%S")
						end
						return "recording to " .. reg
					end,
				},
			},
		})
	end,
}
