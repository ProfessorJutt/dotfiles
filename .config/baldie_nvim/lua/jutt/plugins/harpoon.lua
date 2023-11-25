return {
	"theprimeagen/harpoon",
	lazy = false,
	keys = {
		{
			"<leader>a",
			mode = "n",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Harpoon Mark",
		},
		{
			"<C-e>",
			mode = "n",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Harpoon UI",
		},
		{
			"<C-u>",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Harpoon 1",
		},
		{
			"<C-i>",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Harpoon 2",
		},
		{
			"<C-o>",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Harpoon 3",
		},
		{
			"<C-p>",
			mode = "n",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Harpoon 4",
		},
	},
	config = function() end,
}
