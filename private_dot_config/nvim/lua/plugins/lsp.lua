return {

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },

    {
        'williamboman/mason.nvim',
        lazy = false,
        config = true,
    },

    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            -- Taken from kickstart.nvim
            -- Create an augroup that is used for managing our formatting autocmds.
            --      We need one augroup per client to make sure that multiple clients
            --      can attach to the same buffer without interfering with each other.
            local _augroups = {}
            local get_augroup = function(client)
                if not _augroups[client.id] then
                    local group_name = 'kickstart-lsp-format-' .. client.name
                    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
                    _augroups[client.id] = id
                end

                return _augroups[client.id]
            end

            lsp_zero.on_attach(function(client, bufnr)
                local function map(m, l, r, desc, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    opts.desc = desc
                    vim.keymap.set(m, l, r, opts)
                end

                local function nmap(l, r, desc, opts)
                    map('n', l, r, desc, opts)
                end

                nmap('K', vim.lsp.buf.hover, "Hover")
                nmap('L', vim.lsp.buf.signature_help, "Signature Help")

                nmap('gd', vim.lsp.buf.definition, "Goto definition")
                nmap('gr', require('telescope.builtin').lsp_references, "Goto references")
                nmap('gs', require('telescope.builtin').lsp_document_symbols, "List Document Symbols")
                nmap('gws', require('telescope.builtin').lsp_dynamic_workspace_symbols, "List Workspace Symbols")
                nmap('<leader>rn', vim.lsp.buf.rename, "Rename symbol")
                map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, "Code action")

                map({ 'n', 'v' }, '<leader>f', function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
                end, "Format")



                -- autoformat on save
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = get_augroup(client),
                    callback = function(ev)
                        vim.lsp.buf.format({
                            buffer = ev.buf,
                            async = false,
                            timeout_ms = 5000,
                        })
                    end
                })
            end)

            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require('lspconfig').lua_ls.setup(lua_opts)
                    end,
                }
            })
        end
    },

}
