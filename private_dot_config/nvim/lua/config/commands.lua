local run_tmux = function(command)
    local obj = vim.system({ "tmux", "has-session", "-t", ":.{down-of}" }, { text = true }):wait()
    if obj.code ~= 0 then
        obj = vim.system({ "tmux", "split-window", "-v", "-d", "-l", "30%" }, { text = true }):wait()
        if obj.code ~= 0 then
            print("Could not split window:", obj.stderr)
            return
        end
    end
    obj = vim.system({ "tmux", "send-keys", "-t", "{down-of}", command, "Enter" }, { text = true }):wait()
    if obj.code ~= 0 then
        print("Could not run command:", obj.stderr)
    end
end

local lastCommand = ""

vim.api.nvim_create_user_command("TmuxRun", function(data)
    lastCommand = data.args
    run_tmux(data.args)
end, { nargs = "+" })

vim.api.nvim_create_user_command("TmuxRunLast", function()
    if lastCommand == "" then
        print("No previous command found")
    else
        run_tmux(lastCommand)
    end
end, { nargs = 0 })

local create_tmux_autocmd = function(pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("BestUserCommands", { clear = true }),
        pattern = pattern,
        callback = function()
            run_tmux(command)
        end
    })
end

vim.api.nvim_create_user_command("TmuxRunAuto", function()
    local pattern = vim.fn.input("Pattern: ")
    local command = vim.fn.input("Command: ")
    create_tmux_autocmd(pattern, command)
end, { nargs = 0 })

vim.keymap.set("n", "<leader><leader>t", ":TmuxRun ", { desc = "Run command in separate pane" })
vim.keymap.set("n", "<leader><leader>r", "<Cmd>TmuxRunLast<CR>", { desc = "Run last command in separate pane" })
vim.keymap.set("n", "<leader><leader>a", "<Cmd>TmuxRunAuto<CR>", { desc = "Run commnad on write" })
