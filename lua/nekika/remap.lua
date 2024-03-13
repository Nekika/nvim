vim.g.mapleader = " "

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "[b", vim.cmd.bpreviou)
vim.keymap.set("n", "]b", vim.cmd.bnext)
