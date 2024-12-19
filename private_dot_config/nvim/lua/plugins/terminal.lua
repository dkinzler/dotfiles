return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<leader><leader>t", '<cmd>exe v:count1 . "ToggleTerm"<cr>', mode = { "n", "t" }, desc = "Toggle Terminal" },
            { "<c-h>",             "<cmd>TmuxNavigateLeft<cr>",            mode = "t" },
            { "<c-j>",             "<cmd>TmuxNavigateDown<cr>",            mode = "t" },
            { "<c-k>",             "<cmd>TmuxNavigateUp<cr>",              mode = "t" },
            { "<c-l>",             "<cmd>TmuxNavigateRight<cr>",           mode = "t" },
        },
        cmd = { "TermRunAuto", "TermRunAutoClear" },
        config = function()
            local toggleterm = require("toggleterm")
            local toggleterm_terminal = require("toggleterm.terminal")

            toggleterm.setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    end
                end,
                open_mapping = false,
            })

            local run_command = function(command)
                local id = toggleterm_terminal.get_toggled_id()
                local term = toggleterm_terminal.get(id, true)
                if not term then
                    toggleterm.toggle(1, 15, nil, "horizontal")
                    id = toggleterm_terminal.get_toggled_id()
                    term = toggleterm_terminal.get(id, true)
                end
                if not term then
                    print("could not toggle terminal")
                    return
                end
                if not term:is_open() then
                    term:toggle()
                end
                vim.fn.chansend(term.job_id, command)
            end

            local group = "term-auto-run"
            local create_term_autocmd = function(command, bufnr)
                vim.api.nvim_create_autocmd("BufWritePost", {
                    group = vim.api.nvim_create_augroup(group, { clear = false }),
                    buffer = bufnr,
                    callback = function()
                        run_command(command)
                    end
                })
            end

            vim.api.nvim_create_user_command("TermRunAuto", function()
                local command = vim.fn.input("Command: ")
                local bufnr = vim.api.nvim_get_current_buf()
                create_term_autocmd(command .. "\n", bufnr)
            end, { nargs = 0 })

            vim.api.nvim_create_user_command("TermRunAutoClear", function()
                vim.api.nvim_clear_autocmds({
                    group = group,
                })
            end, { nargs = 0 })

            vim.keymap.set("n", "<leader><leader>r", function()
                run_command("!!\n\n")
            end, { desc = "Rerun last command" })
        end,
    },
}
