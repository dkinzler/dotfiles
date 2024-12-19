vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- diagnostics
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

-- quickfix
vim.keymap.set("n", "<leader>qo", "<Cmd>copen<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>qn", "<Cmd>cnext<CR>zz", { desc = "Quickfix next" })
vim.keymap.set("n", "<leader>qp", "<Cmd>cprev<CR>zz", { desc = "Quickfix prev" })

-- toggle spell check
vim.keymap.set("n", "<leader>sp", "<Cmd>set spell!<CR>", { desc = "Toggle spell check" })

-- control size of splits
vim.keymap.set("n", "<M-,>", "<C-w>5<")
vim.keymap.set("n", "<M-.>", "<C-w>5>")
vim.keymap.set("n", "<M-+>", "<C-W>+")
vim.keymap.set("n", "<M-->", "<C-W>-")
