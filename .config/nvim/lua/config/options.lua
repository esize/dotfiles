-- Options are automatically loaded before lazy.nvim startup

-- set leader
vim.g.mapleader = " "

-- set encoding stuff
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- set the cursor to default (no special cursor)
vim.opt.guicursor = ""

-- enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- set tab settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.expandtab = true

-- enable smart indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- set terminal title to the current file name
vim.opt.title = true

-- turn off line wrapping
vim.opt.wrap = false

-- command previews
vim.opt.inccommand = "split"

-- disable swap/backup
vim.opt.swapfile = false
vim.opt.backup = false

-- enable undo features
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- enable true color support in the terminal
vim.opt.termguicolors = true

-- keep current line in the middle of the screen while scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- add "@" to the list of valid filename characters
vim.opt.isfname:append("@-@")

-- highlight the 80th column
vim.opt.colorcolumn = "80"

-- file explorer Options
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- hide comand line
vim.opt.cmdheight = 0

-- allow backspacing over indents, start of line, start of insert
vim.opt.backspace = { "start", "eol", "indent" }

-- ignore node_modules in searches
vim.opt.wildignore:append({ "*/node_modules*" })

-- prepend asterisks in block comments
vim.opt.formatoptions:append({ "r" })
