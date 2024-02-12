return {
    {
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        version = 'v4.x',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            { '<A-n>', '<Cmd>BufferLineCycleNext<CR>' },
            { '<A-p>', '<Cmd>BufferLineCyclePrev<CR>' },
            { '<A-h>', '<Cmd>lua require("bufferline").go_to(1, true)<CR>' },
            { '<A-j>', '<Cmd>lua require("bufferline").go_to(2, true)<CR>' },
            { '<A-k>', '<Cmd>lua require("bufferline").go_to(3, true)<CR>' },
            { '<A-l>', '<Cmd>lua require("bufferline").go_to(4, true)<CR>' },
            { '<A-o>', '<Cmd>BufferLineMoveNext<CR>' },
            { '<A-i>', '<Cmd>BufferLineMovePrev<CR>' },
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
