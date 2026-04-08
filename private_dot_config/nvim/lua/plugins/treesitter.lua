return {

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        init = function()
            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    -- Enable treesitter highlighting and disable regex syntax
                    -- use pcall to suppress error messages on unsupported file types
                    -- e.g. otherwise opening telescope would throw errors
                    pcall(vim.treesitter.start)
                    -- Enable treesitter-based indentation
                    -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    -- Enable treesitter-based folding
                    -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    -- vim.wo[0][0].foldmethod = 'expr'
                end,
            })

            require("nvim-treesitter").install({ "javascript", "typescript", "c", "zig", "lua", "rust", "go", "yaml",
                "python",
                "markdown" })
        end,
    },

}
