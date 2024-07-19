return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons", enabled = true },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search [K]eymaps" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search [B]uffers" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Search Files" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
