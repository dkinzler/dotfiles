vim.g.mapleader = " "
vim.g.camelcasemotion_key = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({ "n", "v" }, "<A-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<A-u>", "<C-u>zz")

-- Switch between windows
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>w")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
