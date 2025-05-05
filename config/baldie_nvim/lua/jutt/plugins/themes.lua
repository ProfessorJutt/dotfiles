return {
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				show_end_of_buffer = true,
			})
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"rmehri01/onenord.nvim",
		name = "onenord",
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme onenord]])
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			-- vim.cmd([[colorscheme kanagawa]])
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				palettes = {
					carbonfox = {
						sel0 = "#3e4a5b",
						sel1 = "#4f6074",
					},
				},
				options = {
					transparent = true,
					styles = {
						comments = "italic",
					},
				},
			})

			vim.cmd("colorscheme carbonfox")
		end,
	},
}
