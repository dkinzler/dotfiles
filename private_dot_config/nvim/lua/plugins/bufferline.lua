return {
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        version = 'v4.x',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            { '<A-l>', '<Cmd>BufferLineCycleNext<CR>' },
            { '<A-h>', '<Cmd>BufferLineCyclePrev<CR>' },
            { '<A-u>', '<Cmd>lua require("bufferline").go_to(1, true)<CR>' },
            { '<A-i>', '<Cmd>lua require("bufferline").go_to(2, true)<CR>' },
            { '<A-o>', '<Cmd>lua require("bufferline").go_to(3, true)<CR>' },
            { '<A-p>', '<Cmd>lua require("bufferline").go_to(4, true)<CR>' },
            { '<A-k>', '<Cmd>BufferLineMoveNext<CR>' },
            { '<A-j>', '<Cmd>BufferLineMovePrev<CR>' },
            { '<A-d>', '<Cmd>bd<CR>' },
        },
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup({
                options = {
                    style_preset = bufferline.style_preset.minimal,
                    show_buffer_icons = false,
                    indicator = {
                        style = "none",
                    },
                    show_buffer_close_icons = false,
                    diagnostics = "nvim_lsp",
                },
            })
        end
    }
}
