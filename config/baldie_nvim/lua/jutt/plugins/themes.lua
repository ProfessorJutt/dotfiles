return {
  {
    "catppuccin/nvim",
		priority = 1000,
		config = function()
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
			vim.cmd([[colorscheme carbonfox]])
		end,
  },
}
