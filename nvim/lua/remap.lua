vim.g.mapleader = " "
vim.g.camelcasemotion_key = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<A-d>", "<C-d>zz")
vim.keymap.set("n", "<A-u>", "<C-u>zz")

-- Switch between windows
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-l>", "<C-w>w")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<A-p>", builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- toogleterm
vim.keymap.set("n", "<A-c>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
vim.keymap.set("t", "<A-c>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

-- buffers
vim.keymap.set("n", "<A-j>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-k>", "<Cmd>BufferNext<CR>")
