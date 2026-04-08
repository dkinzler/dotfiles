return {

    {
        "nvim-telescope/telescope.nvim",
        version = '*',
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
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
            vim.keymap.set("n", "<C-p>", function()
                builtin.find_files({ no_ignore = true })
            end, { desc = "List files in cwd" })
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
