return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
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
				lualine_a = { {
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				} },
				lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "filetype" },
					{
						"diff",
						symbols = {
							added = '"',
							modified = '"',
							removed = '"',
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = '"',
									modified = '"',
									removed = '"',
								}
							end
						end,
					},
				},
			},
		})
	end,
}
