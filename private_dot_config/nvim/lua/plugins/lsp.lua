return {

    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },

    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {},
            },
        },
        config = function()
            local lspconfig_defaults = require('lspconfig').util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            local buffer_autoformat = function(bufnr)
                local group = 'lsp_autoformat'
                vim.api.nvim_create_augroup(group, { clear = false })
                vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

                vim.api.nvim_create_autocmd('BufWritePre', {
                    buffer = bufnr,
                    group = group,
                    desc = 'LSP format on save',
                    callback = function()
                        vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
                    end,
                })
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local function map(m, l, r, desc, opts)
                        opts = opts or {}
                        opts.buffer = event.buf
                        opts.desc = desc
                        vim.keymap.set(m, l, r, opts)
                    end

                    local function nmap(l, r, desc, opts)
                        map('n', l, r, desc, opts)
                    end

                    nmap('K', vim.lsp.buf.hover, 'Hover')
                    nmap('L', vim.lsp.buf.signature_help, 'Signature Help')
                    nmap('gd', vim.lsp.buf.definition, 'Goto definition')
                    nmap('gr', require('telescope.builtin').lsp_references, 'Goto references')
                    nmap('gs', require('telescope.builtin').lsp_document_symbols, 'List Document Symbols')
                    nmap('gws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'List Workspace Symbols')
                    nmap('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
                    nmap('<leader>ca', vim.lsp.buf.code_action, 'Code action')
                    nmap('<leader>li', function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    end, 'Toggle inlay hints')
                    -- in visual mode the default is to format the selected region
                    map({ 'n', 'v' }, '<leader>lf', function()
                        vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
                    end, 'Format')


                    local id = vim.tbl_get(event, 'data', 'client_id')
                    local client = id and vim.lsp.get_client_by_id(id)
                    if client == nil then
                        return
                    end

                    -- make sure there is at least one client with formatting capabilities
                    if client.supports_method('textDocument/formatting') then
                        buffer_autoformat(event.buf)
                    end
                end,
            })

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })
        end
    },

}
