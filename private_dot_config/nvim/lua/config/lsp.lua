-- Note: vim.lsp.enable() is called automatically by mason-lspconfig for installed servers

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
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP format on save',
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, async = false, timeout_ms = 5000, })
                end,
            })
        end
    end,
})
