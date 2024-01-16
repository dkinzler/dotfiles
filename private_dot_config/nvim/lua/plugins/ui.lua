return {

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('tokyonight').setup({
                style = 'night',
                styles = {
                    comments = {
                        italic = true,
                    },
                },
                on_colors = function(colors)
                    colors.bg = "#0f0f0f"
                    colors.bg_float = "#0c0c0c"
                    colors.bg_sidebar = "#0c0c0c"
                    colors.bg_statusline = "#0b0b0b"
                    colors.comment = "#efefef"
                end,
                on_highlights = function(hl, colors)
                    hl.WinSeparator = {
                        bold = true,
                        fg = colors.fg_dark,
                    }
                    hl.BufferLineBackground = {
                        -- used for non-selected buffers
                        fg = colors.fg_dark,
                        bg = colors.bg,
                    }
                    hl.BufferLineBufferSelected = {
                        fg = colors.blue,
                        bold = true,
                        italic = false,
                        bg = colors.fg_gutter,
                    }
                end
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                theme = 'auto',
                globalstatus = true, -- single status line at bottom, not one per window
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = {
                    {
                        'filename',
                        path = 3,
                        color = {
                            fg = 'fg_dark',
                            bg = 'bg_statusline',
                        },
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = { 'encoding' },
                lualine_y = { 'progress' },
                lualine_z = { 'location', 'mode' },
            },
        },
    },

    {
        'nvim-tree/nvim-web-devicons',
    },

    -- indent guides
    -- {
    --   "lukas-reineke/indent-blankline.nvim",
    --   event = { "BufReadPost", "BufNewFile" },
    --   opts = {
    --     char = "│",
    --     filetype_exclude = {
    --       "help",
    --       "alpha",
    --       "dashboard",
    --       "neo-tree",
    --       "Trouble",
    --       "lazy",
    --       "mason",
    --       "notify",
    --       "toggleterm",
    --       "lazyterm",
    --     },
    --     show_trailing_blankline_indent = false,
    --     show_current_context = false,
    --   },
    -- },

}
