return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            spec = {
                { "<leader>f", group = "Telescope" },
                { "<leader>e", group = "Diagnostics" },
                { "<leader>l", group = "LSP", icon = "" },
                { "<leader>p", group = "Oil", icon = "" },
                { "<leader>q", group = "Quickfix" },
                { "<leader>q", group = "Quickfix" },
                { "<leader>s", group = "Spell", icon = "󰓆" },
                { "<leader>t", group = "Trouble", icon = "" },
                { "<leader><leader>", group = "Terminal" },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}
