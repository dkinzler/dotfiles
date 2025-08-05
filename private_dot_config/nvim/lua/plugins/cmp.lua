return {
    -- {
    --     "L3MON4D3/LuaSnip",
    --     version = "v2.*",
    --     dependencies = {
    --         {
    --             "rafamadriz/friendly-snippets",
    --             config = function()
    --                 require("luasnip.loaders.from_vscode").lazy_load()
    --             end,
    --         },
    --     },
    --     opts = {},
    -- },

    -- {
    --     'hrsh7th/nvim-cmp',
    --     event = 'InsertEnter',
    --     dependencies = {
    --         'saadparwaiz1/cmp_luasnip',
    --         'hrsh7th/cmp-buffer',
    --         'onsails/lspkind.nvim',
    --     },
    --     config = function()
    --         local cmp = require('cmp')
    --         local luasnip = require('luasnip')
    --         local lspkind = require('lspkind')
    --
    --         cmp.setup({
    --             snippet = {
    --                 expand = function(args)
    --                     luasnip.lsp_expand(args.body)
    --                 end,
    --             },
    --             mapping = cmp.mapping.preset.insert({
    --                 ['<C-p>'] = cmp.mapping.select_prev_item(),
    --                 ['<C-n>'] = cmp.mapping.select_next_item(),
    --                 ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    --                 ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --                 -- open completion menu
    --                 ['<C-Space>'] = cmp.mapping.complete(),
    --                 -- abort completion
    --                 ['<C-e>'] = cmp.mapping.abort(),
    --                 ['<CR>'] = cmp.mapping.confirm {
    --                     behavior = cmp.ConfirmBehavior.Replace,
    --                     -- accept first item if nothing is selected
    --                     select = true,
    --                 },
    --                 ['<Tab>'] = cmp.mapping(function(fallback)
    --                     if cmp.visible() then
    --                         cmp.select_next_item()
    --                     elseif luasnip.locally_jumpable() then
    --                         luasnip.jump(1)
    --                     else
    --                         fallback()
    --                     end
    --                 end, { 'i', 's' }),
    --                 ['<S-Tab>'] = cmp.mapping(function(fallback)
    --                     if cmp.visible() then
    --                         cmp.select_prev_item()
    --                     elseif luasnip.locally_jumpable(-1) then
    --                         luasnip.jump(-1)
    --                     else
    --                         fallback()
    --                     end
    --                 end, { 'i', 's' }),
    --             }),
    --             sources = {
    --                 { name = 'nvim_lsp' },
    --                 { name = 'luasnip' },
    --                 { name = 'buffer' },
    --             },
    --             preselect = cmp.PreselectMode.None, --never preselect an item
    --             formatting = {
    --                 format = lspkind.cmp_format({
    --                     mode = "symbol_text",
    --                     menu = ({
    --                         buffer = "[BUF]",
    --                         nvim_lsp = "[LSP]",
    --                         luasnip = "[SNP]",
    --                     }),
    --                 }),
    --                 expandable_indicator = false,
    --             },
    --         })
    --     end
    -- },


    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                -- copied from the defaults to have them explicitely
                ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-e>'] = { 'hide' },
                -- accepts first if no item is selected
                ['<CR>'] = { 'select_and_accept', 'fallback' },

                ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

                ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
                ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
                ['<Tab>'] = {
                    function(cmp)
                        if not cmp.snippet_active() then
                            return cmp.select_next()
                        end
                    end,
                    "snippet_forward",
                    "fallback",
                },
                ['<S-Tab>'] = {
                    function(cmp)
                        if not cmp.snippet_active() then
                            return cmp.select_prev()
                        end
                    end,
                    "snippet_forward",
                    "fallback",
                },
            },
            cmdline = {
                keymap = {
                    preset = 'inherit',
                    ['<CR>'] = { 'select_and_accept', 'fallback' },
                    -- ['<Tab>'] = { 'show', 'select_next' },
                    ['<Tab>'] = {
                        function(cmp)
                            -- if there is only a single match accept it
                            if cmp.is_menu_visible() and #cmp.get_items() == 1 then
                                return cmp.select_and_accept()
                            end
                        end,
                        'show',
                        'select_next',
                    },
                    ['<S-Tab>'] = { 'show', 'select_prev' },
                },
            },
            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = true } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "rust" }
        },
        opts_extend = { "sources.default" }
    },
}
