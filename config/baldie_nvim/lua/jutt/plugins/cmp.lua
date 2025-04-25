-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		{
-- 			"L3MON4D3/LuaSnip",
-- 			version = "v2.*",
-- 			build = "make install_jsregexp",
-- 		},
-- 		"saadparwaiz1/cmp_luasnip", -- for autocompletion
--
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		"hrsh7th/cmp-buffer", -- source for text in buffer
-- 		"hrsh7th/cmp-path", -- source for file system paths
--
-- 		"rafamadriz/friendly-snippets", -- useful snippets
-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
-- 	},
-- 	config = function()
-- 		local cmp = require("cmp")
-- 		local luasnip = require("luasnip")
-- 		local lspkind = require("lspkind")
--
-- 		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
-- 		require("luasnip.loaders.from_vscode").lazy_load()
--
-- 		cmp.setup({
-- 			completion = {
-- 				completeopt = "menu,menuone,popup",
-- 			},
-- 			window = {
-- 				completion = cmp.config.window.bordered(),
-- 				documentation = cmp.config.window.bordered(),
-- 			},
-- 			snippet = {
-- 				expand = function(args)
-- 					luasnip.lsp_expand(args.body)
-- 				end,
-- 			},
-- 			mapping = cmp.mapping.preset.insert({
-- 				["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
-- 				["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
-- 				["<C-e>"] = cmp.mapping.abort(), -- close completion window
-- 				["<CR>"] = cmp.mapping.confirm({ select = false }),
-- 			}),
-- 			-- sources for autocompletion
--
-- 			sources = cmp.config.sources({
-- 				{ name = "nvim_lsp" },
-- 				{ name = "luasnip" }, -- snippets
-- 				{ name = "buffer" }, -- text within current buffer
-- 				{ name = "path" }, -- file system paths
-- 			}),
--
-- 			-- configure lspkind for vs-code like pictograms in completion menu
-- 			formatting = {
-- 				format = lspkind.cmp_format({
-- 					maxwidth = 100,
-- 					ellipsis_char = "...",
-- 				}),
-- 			},
-- 		})
-- 	end,
-- }

return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",

	opts = {
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true },
			menu = {
				draw = {
					padding = { 0, 1 },
					components = {
						kind_icon = {
							text = function(ctx)
								return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
							end,
						},
					},
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
