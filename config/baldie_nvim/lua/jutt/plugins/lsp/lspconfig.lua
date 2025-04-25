return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },

	opts = {
		servers = {
			basedpyright = {
				settings = {
					basedpyright = {
						typeCheckingMode = "standard",
					},
				},
			},
			emmet_language_server = {
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
					"svelte",
				},
			},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
