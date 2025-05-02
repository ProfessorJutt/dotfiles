local keymap = vim.keymap

-- pane splits
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Get to the end of a line while still in insert mode.
keymap.set("i", "<C-l>", "<ESC>$a")
keymap.set("i", "<C-h>", "<ESC>0i")

-- better indenting
keymap.set("v", "<S-Tab>", "<gv")
keymap.set("v", "<Tab>", ">gv")

-- clear them dummmm search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
