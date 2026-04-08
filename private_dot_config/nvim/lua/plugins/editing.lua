return {

    {
        'numToStr/Comment.nvim',
        opts = {},
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },

    {
        "nvim-mini/mini.surround",
        version = false,
        keys = {
            -- lazy load on any of these keys
            -- does not actually define the mappings
            { "Sa", nil },
            { "Sd", nil },
            { "Sr", nil },
        },
        opts = {
            mappings = {
                add = 'Sa',       -- Add surrounding in Normal and Visual modes
                delete = 'Sd',    -- Delete surrounding
                replace = 'Sr',   -- Replace surrounding

                find = '',        -- Find surrounding (to the right)
                find_left = '',   -- Find surrounding (to the left)
                highlight = '',   -- Highlight surrounding

                suffix_last = '', -- Suffix to search with "prev" method
                suffix_next = '', -- Suffix to search with "next" method
            },
        },
    },

    {
        "nvim-mini/mini.ai",
        version = false,
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function(_, _)
            local gen_spec = require("mini.ai").gen_spec
            require("mini.ai").setup({
                custom_textobjects = {
                    F = gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
                    i = gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }),
                },
                n_lines = 150,
            })
        end
    },

    -- TODO: treesitter provider broken since nvim-treesitter rewrite
    --       might be fixed in the future - 04/2026
    --
    -- Automatically highlight other uses of the word under cursor
    -- {
    --     "RRethy/vim-illuminate",
    --     lazy = true,
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {
    --         providers = {
    --             "lsp",
    --             "treesitter",
    --             -- "regex",
    --         },
    --         delay = 200,
    --     },
    --     config = function(_, opts)
    --         require("illuminate").configure(opts)
    --     end
    -- },

}
