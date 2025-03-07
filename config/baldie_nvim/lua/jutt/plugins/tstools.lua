return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
		  settings = {
		    tsserver_plugins = {
          -- npm install -g @styled/typescript-styled-plugin typescript-styled-plugin
		      "@styled/typescript-styled-plugin"
		    }
		  }
		})
	end,
	opts = {},
}
