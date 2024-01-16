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
                add = 'sa',          -- Add surrounding in Normal and Visual modes
                delete = 'sd',       -- Delete surrounding
                replace = 'sr',      -- Replace surrounding

                find = '',           -- Find surrounding (to the right)
                find_left = '',      -- Find surrounding (to the left)
                highlight = '',      -- Highlight surrounding
                update_n_lines = '', -- Update `n_lines`

                suffix_last = '',    -- Suffix to search with "prev" method
                suffix_next = '',    -- Suffix to search with "next" method
            },
        },
    },

    -- Automatically highlight other uses of the word under cursor
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            providers = {
                "lsp",
                "treesitter",
            },
            delay = 200,
            large_file_cutoff = 4000,   -- use large_file_overrides for files with more than 4000 lines
            large_file_overrides = nil, -- nil will disable vim-illuminate for large files
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end
    },

}
