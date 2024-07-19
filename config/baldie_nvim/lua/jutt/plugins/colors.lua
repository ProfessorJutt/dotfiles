return {
	{
		"rmehri01/onenord.nvim",
		name = "onenord",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme onenord]])
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
}
