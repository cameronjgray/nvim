
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>nt", vim.cmd.Ex)

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
vim.keymap.set("x", "<leader>bp", [["_dP]])

-- replace all occurences
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- center next
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- prettier
vim.keymap.set("n", "<leader>ff", ":! npx prettier -w <C-R>%<CR><CR>")

-- jest
vim.keymap.set("n", "<leader>tf", ":! npx jest <C-R>%<CR>")
vim.keymap.set("n", "<leader>tc", ":! npx jest --coverage --silent --colors<CR>")

-- js comment
vim.keymap.set("n", "<leader>jc", "I// <C-C>")

-- increment
vim.keymap.set("n", "<leader>i", "<C-a>")

-- decrement
vim.keymap.set("n", "<leader>d", "<C-x>")

-- whitespace
vim.keymap.set("n", "<leader>o", "o<C-C>")
vim.keymap.set("n", "<leader>O", "O<C-C>")
