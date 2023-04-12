
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--noremap <Up> <Nop>
--noremap <Down> <Nop>
--noremap <Left> <Nop>
--noremap <Right> <Nop>
--noremap <C-d> <C-d>zz
--noremap <C-u> <C-u>zz

vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "Q", "<Nop>")

-- center on scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- move when highlighting
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without copy
vim.keymap.set("x", "<leader>p", [["_dP]])

-- replace all occurences
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- center next
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
