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

local find_function_name = function()
    local node = vim.treesitter.get_node()
    while node do
        if node:type() == 'function_declaration' or node:type() == 'method_declaration' then
            break
        end
        node = node:parent()
    end
    if not node then
        return
    end
    local name_node = node:field('name')[1]
    if name_node then
        local function_name = vim.treesitter.get_node_text(name_node, 0)
        return function_name
    end
end

local run_go_test = function()
    local function_name = find_function_name()
    if not function_name then
        vim.api.nvim_err_writeln('function or method name not found')
        return
    end
    vim.cmd(string.format('!go test -run %s', function_name))
end

vim.keymap.set("n", "<leader>ts", run_go_test, { desc = "treesitter test" })
