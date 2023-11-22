local opt = vim.opt
local lsp = vim.lsp

-- line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- ui
opt.termguicolors = true
opt.tabstop = 2
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 25

-- pretty hinteroos
lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false

-- disable mode
opt.showmode = false

-- stuff from lazy
opt.grepprg = "rg --vimgrep"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Sppppeeeeeddd
vim.g.skip_ts_context_commentstring_module = true
