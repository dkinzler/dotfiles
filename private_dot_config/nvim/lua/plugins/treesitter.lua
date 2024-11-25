return {

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            -- 'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                -- A list of parser names, or "all"
                ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "go", "yaml", "python",
                    "markdown" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
                -- textobjects = {
                --     select = {
                --         enable = true,
                --         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                --         keymaps = {
                --             -- You can use the capture groups defined in textobjects.scm
                --             -- ['aa'] = { query = '@parameter.outer', desc = "Select parameter" },
                --             -- ['ia'] = { query = '@parameter.inner', desc = "Select inner parameter" },
                --
                --             -- ['af'] = { query = '@function.outer', desc = "Select function" },
                --             -- ['if'] = { query = '@function.inner', desc = "Select inner function" },
                --
                --             -- ['ai'] = { query = '@conditional.outer', desc = "Select conditional" },
                --             -- ['ii'] = { query = '@conditional.inner', desc = "Select inner conditional" },
                --             -- ['ai'] = { query = '@block.outer', desc = "Select block" },
                --             -- ['ii'] = { query = '@block.inner', desc = "Select inner block" },
                --             --
                --             -- ['ac'] = { query = '@call.outer', desc = "Select call" },
                --             -- ['ic'] = { query = '@call.inner', desc = "Select inner call" },
                --
                --
                --             -- inside () and {} can already use b and B
                --             -- although these might not work in other languages, e.g. for python
                --             -- we might want to use block for B
                --         },
                --     },
                -- },
            })
        end,
    },

}
