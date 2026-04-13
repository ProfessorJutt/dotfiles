local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		-- set keybinds
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

		-- opts.desc = "Show LSP definition"
		-- keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definition

		--- Custom Float PEEK
		opts.desc = "Peek definition"
		keymap.set("n", "gd", function()
			local params = vim.lsp.util.make_position_params(0, "utf-8")

			vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result)
				if not result or vim.tbl_isempty(result) then
					vim.notify("No definition found")
					return
				end

				local def = result[1]
				local uri = def.uri or def.targetUri
				local range = def.range or def.targetSelectionRange

				local bufnr = vim.uri_to_bufnr(uri)
				vim.fn.bufload(bufnr)

				-- calculate big floating window size
				local width = math.floor(vim.o.columns * 0.9)
				local height = math.floor(vim.o.lines * 0.8)

				local row = math.floor((vim.o.lines - height) / 2 - 1)
				local col = math.floor((vim.o.columns - width) / 2)

				local win = vim.api.nvim_open_win(bufnr, true, {
					relative = "editor",
					style = "minimal",
					border = "rounded",
					width = width,
					height = height,
					row = row,
					col = col,
				})

				-- move cursor to definition
				vim.api.nvim_win_set_cursor(win, {
					range.start.line + 1,
					range.start.character,
				})

				vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = bufnr, silent = true })
			end)
		end, opts)

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "<leader>d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts) -- jump to next diagnostic in buffer

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end,
})

-- vim.lsp.inlay_hint.enable(true)

local severity = vim.diagnostic.severity

vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})
