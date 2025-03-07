return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",

		"WhoIsSethDaniel/mason-tool-installer.nvim",

    { "folke/neodev.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },

		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"dockerls",
				"docker_compose_language_service",
				"terraformls",
				"yamlls",
				"ruff",
				"basedpyright",
				"bashls",
				"gopls",
				-- "vtsls",
			},
		})


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

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["emmet_language_server"] = function()
				lspconfig["emmet_language_server"].setup({
					capabilities = capabilities,
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
				})
			end,
		})
	end,
}
