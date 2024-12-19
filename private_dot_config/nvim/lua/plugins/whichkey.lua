return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup({})

            wk.add({
                { "<leader>f", group = "Telescope" },
                { "<leader>e", group = "Diagnostics" },
                { "<leader>l", group = "LSP", icon = "" },
                { "<leader>p", group = "Oil", icon = "" },
                { "<leader>q", group = "Quickfix" },
                { "<leader>q", group = "Quickfix" },
                { "<leader>s", group = "Spell", icon = "󰓆" },
                { "<leader>t", group = "Trouble", icon = "" },
                { "<leader><leader>", group = "Terminal" },
            })
        end,
    },
}
