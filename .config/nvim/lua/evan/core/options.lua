-- set leader
vim.g.mapleader = " "

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces per tab
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tabs to spaces
opt.autoindent = true -- copy indent from current line to new line

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- make search case sensitive when mixed case input provided

opt.cursorline = true

opt.termguicolors = true -- turn on colors
opt.background = "dark" -- colorschemes that can be light or dark will be dark
opt.signcolumn = "yes" -- show sign column so text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical windows to the right
opt.splitbelow = true -- split horizontal window to the bottom

