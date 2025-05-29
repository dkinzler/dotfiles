return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {
                "neovim/nvim-lspconfig",
                -- config = function()
                --     vim.lsp.config(
                --         "*",
                --         {
                --             capabilities = require("blink.cmp").get_lsp_capabilities(),
                --         }
                --     )
                -- end,
            },
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {},
            },
        },
    }
}
