return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{ "folke/neodev.nvim", opts = {} },
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		servers = {
		  vtsls = {},
			bashls = {},
			cssls = {},
			docker_compose_language_service = {},
			dockerls = {},
			gopls = {},
			html = {},
			lua_ls = {},
			tailwindcss = {},
			terraformls = {},
			yamlls = {},
			ruff = {},
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

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
				end

				local telescope = require("telescope.builtin")

				map("gR", telescope.lsp_references, "Show references")
				map("gD", vim.lsp.buf.declaration, "Go to declaration")
				map("gd", telescope.lsp_definitions, "Show definitions")
				map("gi", telescope.lsp_implementations, "Show implementations")
				map("gt", telescope.lsp_type_definitions, "Show type definitions")
				-- map("K", vim.lsp.buf.hover, "Show documentation for what is under cursor")
				map("<leader>ca", vim.lsp.buf.code_action, "See available code actions")
				map("<leader>rn", vim.lsp.buf.rename, "Smart rename")
				-- map("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
			end,
		})

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
