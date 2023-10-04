return {

    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {},
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },

    {
        "echasnovski/mini.surround",
        opts = {
            mappings = {
                add = '<leader>sa',     -- Add surrounding in Normal and Visual modes
                delete = '<leader>sd',  -- Delete surrounding
                replace = '<leader>sr', -- Replace surrounding
            },
        },
    },

    -- Text objects
    -- {
    --     'echasnovski/mini.ai',
    --     version = false,
    --     opts = {},
    -- },

}
