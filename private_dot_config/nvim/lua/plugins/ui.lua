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
                    -- highlight group names can be found in the tokyonight theme files
                    hl.WinSeparator = {
                        bold = true,
                        fg = colors.fg_dark,
                    }
                    hl.BufferCurrent.bg = colors.fg_gutter;
                    hl.BufferCurrentERROR.bg = colors.fg_gutter;
                    hl.BufferCurrentHINT.bg = colors.fg_gutter;
                    hl.BufferCurrentINFO.bg = colors.fg_gutter;
                    hl.BufferCurrentIndex.bg = colors.fg_gutter;
                    hl.BufferCurrentMod.bg = colors.fg_gutter;
                    hl.BufferCurrentSign.bg = colors.fg_gutter;
                    hl.BufferCurrentTarget.bg = colors.fg_gutter;
                    hl.BufferCurrentWARN.bg = colors.fg_gutter;
                    hl.BufferTabpageFill = {
                        bg = colors.bg,
                    }
                end
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },

    {
        'nvim-tree/nvim-web-devicons',
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
        'romgrk/barbar.nvim',
        version = '^1.0.0',
        event = 'VeryLazy',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        keys = {
            { '<A-n>', '<Cmd>BufferNext<CR>',         desc = 'Next Buffer' },
            { '<A-p>', '<Cmd>BufferPrevious<CR>',     desc = 'Previous Buffer' },
            { '<A-h>', '<Cmd>BufferGoto 1<CR>',       desc = 'Goto Buffer 1' },
            { '<A-j>', '<Cmd>BufferGoto 2<CR>',       desc = 'Goto Buffer 2' },
            { '<A-k>', '<Cmd>BufferGoto 3<CR>',       desc = 'Goto Buffer 3' },
            { '<A-l>', '<Cmd>BufferGoto 4<CR>',       desc = 'Goto Buffer 4' },
            { '<A-o>', '<Cmd>BufferMoveNext<CR>',     desc = 'Move Buffer Next' },
            { '<A-i>', '<Cmd>BufferMovePrevious<CR>', desc = 'Move Buffer Prev' },
            { '<A-d>', '<Cmd>bd<CR>',                 desc = 'Close Buffer' },
        },
        config = function()
            vim.g.barbar_auto_setup = false
            require("barbar").setup({
                animation = false,
                auto_hide = false,
                icons = {
                    separator = { left = '', right = '' },
                    separator_at_end = false,
                    filetype = {
                        enabled = false,
                    },
                },
            })
        end,
    },
}
