-- return {
-- 	{
-- 		"nvim-neo-tree/neo-tree.nvim",
-- 		branch = "v3.x",
-- 		dependencies = {
-- 			"nvim-lua/plenary.nvim",
-- 			"MunifTanjim/nui.nvim",
-- 			"nvim-tree/nvim-web-devicons",
-- 		},
-- 		keys = {
-- 			{ "<leader>e", "<CMD>Neotree toggle<CR>", desc = "NeoTree" },
-- 		},
-- 	},
-- }

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
		keys = {
			{ "<leader>e", "<CMD>Neotree toggle<CR>", desc = "NeoTree" },
		},
    lazy = false, -- neo-tree will lazily load itself
  }
}
