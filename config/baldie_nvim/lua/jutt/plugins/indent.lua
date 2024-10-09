return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			char = ">",
			tab_char = "│",
		},
		scope = { enabled = false },
		exclude = {
			buftypes = {
				"nofile",
				"terminal",
			},
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
	config = function()
		require("ibl").setup()
	end,
}
