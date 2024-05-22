return {

    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.3',
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_config = {
                        prompt_position = "top",
                    },
                    -- display results top to bottom
                    sorting_strategy = "ascending",
                    results_title = false,
                },
            })

            require("telescope").load_extension("ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "List files in cwd" })
            vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
                { desc = 'Search current Word' })
            vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Live grep in cwd" })
            vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
            return vim.fn.executable "make" == 1
        end,
    },

}
