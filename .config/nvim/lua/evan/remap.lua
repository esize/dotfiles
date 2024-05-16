-- set the "leader" key to space
vim.g.mapleader = " "

-- use " pv" to go to explore current directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- when line(s) are highlighted, use J or K to move them
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- bring the next line to the end of the current line
vim.keymap.set("n", "J", "mzJ`z")

-- scroll up and down half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor stays in the middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste and send current selection to void
vim.keymap.set("x", "<leader>p", [["_dP]])

-- <leader>y will yank into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete current line
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Q is good for absolutely nothing
vim.keymap.set("n", "Q", "<nop>")

-- new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- navigate quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- navigate location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- find and replace all instances of the word the cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- if in a bash file, <leader>x makes the file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source the current file on double space
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window
vim.keymap.set("n", "<leader>sc", ":close<CR>")    -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")     -- go to prev tab

-- save as sudo
vim.api_nvim_set_keymap('c', 'w!!', "<esc>:lua require'utils'.sudo_write()<CR>", { silent = true })
