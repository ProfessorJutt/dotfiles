local opt = vim.opt
local lsp = vim.lsp

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indention
opt.smartindent = true
opt.autoindent = true
opt.cindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftround = true
opt.shiftwidth = 2
opt.copyindent = true

-- line numbers
opt.relativenumber = true
opt.number = true
opt.cursorline = true 

-- line wrapping
opt.wrap = false

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "Doink"
opt.fillchars:append("fold: ")
opt.foldlevelstart = 99

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- ui
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 55
opt.cmdheight = 0
opt.mouse = "a"

-- pretty hinteroos
lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({ border = "rounded" })
lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({ border = "rounded" })

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
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full"
opt.breakindent = true
