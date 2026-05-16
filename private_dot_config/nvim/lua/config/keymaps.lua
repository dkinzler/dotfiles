vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- diagnostics
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })
vim.keymap.set("n", "<leader>ep", function()
    vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "<leader>en", function()
    vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic message" })

-- quickfix
vim.keymap.set("n", "<leader>qq", function()
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            vim.cmd("cclose")
            return
        end
    end
    vim.cmd("copen")
end, { desc = "Toggle quickfix" })
vim.keymap.set("n", "<leader>qn", "<Cmd>cnext<CR>zz", { desc = "Quickfix next" })
vim.keymap.set("n", "<leader>qp", "<Cmd>cprev<CR>zz", { desc = "Quickfix prev" })
vim.keymap.set("n", "<leader>qg", function()
    vim.ui.input({ prompt = "Grep > " }, function(input)
        if not input or input == "" then return end

        local cmd = "rg --vimgrep --smart-case " .. vim.fn.shellescape(input)
        local result = vim.fn.systemlist(cmd)

        vim.fn.setqflist({}, "r", {
            title = "Grep: " .. input,
            lines = result,
        })

        vim.cmd("copen")
    end)
end, { desc = "Grep quickfix" })

-- toggle spell check
vim.keymap.set("n", "<leader>sp", "<Cmd>set spell!<CR>", { desc = "Toggle spell check" })

-- control size of splits
vim.keymap.set("n", "<M-,>", "<C-w>5<")
vim.keymap.set("n", "<M-.>", "<C-w>5>")
vim.keymap.set("n", "<M-+>", "<C-W>+")
vim.keymap.set("n", "<M-->", "<C-W>-")
