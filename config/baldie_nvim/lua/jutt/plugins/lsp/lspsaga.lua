return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = false,
			},
			diagnostic = {
				max_height = 0.8,
				keys = {
					quit = { "q", "<ESC>" },
				},
			},
			beacon = {
				enable = false,
			},
			lightBulb = {
				enable = false,
			},

			-- ui = {
			--   code_action = '!'
			-- }
		})

		vim.keymap.set("n", "<leader>d", "<CMD>Lspsaga diagnostic_jump_next<CR>")
		vim.keymap.set("n", "<M-t>", "<CMD>Lspsaga term_toggle<CR>")
		vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>")
	end,
}
