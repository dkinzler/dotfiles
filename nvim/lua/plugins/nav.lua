return {

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    layout_config = {
                        prompt_position = "top",
                    },
                    -- display results top to bottom
                    sorting_strategy = "ascending",
                    results_title = false,
                }
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<A-p>", builtin.find_files, {})
            vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
            vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, {})
            vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
        end,
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>ha", mark.add_file)
            vim.keymap.set("n", "<leader>hq", ui.toggle_quick_menu)

            vim.keymap.set("n", "<leader>hn", ui.nav_next)
            vim.keymap.set("n", "<leader>hp", ui.nav_prev)
            vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
        end,
    },

}
