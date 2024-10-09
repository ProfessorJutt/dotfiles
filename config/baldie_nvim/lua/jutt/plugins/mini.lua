return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.comment").setup()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup()
		require("mini.cursorword").setup()
		require("mini.pairs").setup()
		require("mini.jump2d").setup()

		vim.api.nvim_set_hl(0, "MiniCursorword", { underline = true })
		vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { underline = true })
	end,
}
