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
                        -- same bg color as tmux status bar
                        bg = "#000000",
                    }
                    hl.BufferLineBufferSelected = {
                        fg = "#ffffff",
                        bold = true,
                        italic = false,
                    }
                    hl.BufferLineNumbers = {
                        fg = colors.fg_dark,
                        bold = false,
                        italic = false,
                    }
                    hl.BufferLineNumbersSelected = {
                        fg = "#ffffff",
                        bold = true,
                        italic = false,
                    }
                end
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        version = 'v4.x',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            { '<A-k>', '<Cmd>BufferLineCycleNext<CR>' },
            { '<A-j>', '<Cmd>BufferLineCyclePrev<CR>' },
        },
        config = function()
            local hp = require('harpoon.mark')

            require('bufferline').setup({
                options = {
                    show_buffer_icons = false,
                    show_buffer_close_icons = false,
                    numbers = function(opts)
                        local i = hp.get_index_of(vim.api.nvim_buf_get_name(opts.id))
                        if i == nil then
                            return nil
                        end
                        return string.format('%s', i)
                    end,
                    -- buffers in harpoon first, then others sorted by id
                    sort_by = function(buffer_a, buffer_b)
                        local i1 = hp.get_index_of(buffer_a.path)
                        local i2 = hp.get_index_of(buffer_b.path)
                        if i1 == nil then
                            if i2 == nil then
                                return buffer_a.id < buffer_b.id
                            else
                                return false
                            end
                        else
                            if i2 == nil then
                                return true
                            else
                                return i1 < i2
                            end
                        end
                    end,
                    diagnostics = "nvim_lsp",
                },
            })
        end
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
