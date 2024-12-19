return {

    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        config = function()
            require("telescope").setup({
                -- use ivy theme for all pickers
                defaults = require("telescope.themes").get_ivy({
                    results_title = false,
                }),
            })

            require('telescope').load_extension('fzf')
            require("telescope").load_extension("ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "List files in cwd" })
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles,
                { desc = 'List previously open files' })
            vim.keymap.set('n', '<leader>fw', builtin.grep_string,
                { desc = 'Search current Word' })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep in cwd" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
            vim.keymap.set("n", "<leader>fc", function()
                builtin.find_files({
                    cwd = vim.fn.stdpath("config"),
                })
            end, { desc = "List config files" })
        end,
    },


}
