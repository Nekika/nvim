vim.g.mapleader = " "

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "[b", vim.cmd.bpreviou)
vim.keymap.set("n", "]b", vim.cmd.bnext)
vim.keymap.set("n", "[w", "<C-w>W")
vim.keymap.set("n", "]w", "<C-w>w")

vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")
