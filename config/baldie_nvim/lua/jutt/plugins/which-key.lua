return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local which = require("which-key")
		which.setup()
		which.add({ group = "Code", lhs = "<leader>c" })
		which.add({ group = "Session", lhs = "<leader>q" })
	end,
}
