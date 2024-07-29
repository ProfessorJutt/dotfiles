local opt = vim.opt
local lsp = vim.lsp

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indention
opt.smartindent = true
opt.autoindent = true
opt.cindent = true

opt.smartcase = true
opt.cmdheight = 0

-- line numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = false

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

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

opt.swapfile = true
opt.showmode = false

-- Whichkey timeout
opt.timeoutlen = 300

-- stuff from lazy
opt.grepprg = "rg --vimgrep"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shiftwidth = 2
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full"
opt.expandtab = true
opt.breakindent = true
