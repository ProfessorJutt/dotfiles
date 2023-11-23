return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		vim.keymap.set("i", "<C-u>", function()
			return vim.fn["codeium#Complete"]()
		end, { expr = true })

		vim.keymap.set("i", "<C-n>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })

		vim.keymap.set("i", "<C-p>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true })

		vim.keymap.set("i", "<C-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true })
	end,
}
