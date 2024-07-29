local keymap = vim.keymap

-- pane splits
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- better indenting
keymap.set("v", "<S-Tab>", "<gv")
keymap.set("v", "<Tab>", ">gv")

-- clear them dummmm search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
