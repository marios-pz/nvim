local my_utils = require('utils')

local M = {}

M.setup = function()
    local icons = require('icons')
    local signs = {
        { name = 'DiagnosticSignError', text = icons.diagnostics.BoldError },
        { name = 'DiagnosticSignWarn',  text = icons.diagnostics.BoldWarning },
        { name = 'DiagnosticSignHint',  text = icons.diagnostics.BoldHint },
        { name = 'DiagnosticSignInfo',  text = icons.diagnostics.BoldInformation },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    local config = {
        virtual_text = {
            prefix = icons.ui.CircleDot,
        },
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'if_many', -- "if_many" or "always"
            header = '',
            prefix = '',
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    })
end

local function lsp_keymaps(bufnr)
    local create_command = my_utils.create_command
    local command = my_utils.command
    local buf_keymap = function(mode, lhs, rhs)
        my_utils.buf_keymap(mode, lhs, rhs, bufnr)
    end

    buf_keymap('n', 'gD', function()
        command('Telescope lsp_references')
    end)
    buf_keymap('n', 'gd', function()
        command('Telescope lsp_definitions')
    end)

    buf_keymap('n', 'K', vim.lsp.buf.hoveg)
    buf_keymap('n', 'gi', vim.lsp.buf.implementation)
    buf_keymap('n', '<C-k>', vim.lsp.buf.signature_help)
    buf_keymap('n', '[d', function()
        vim.diagnostic.goto_prev({ border = 'rounded' })
    end)
    buf_keymap('n', 'gl', function()
        vim.diagnostic.open_float(0, { scope = 'line', border = 'rounded' })
    end)
    buf_keymap('n', ']d', function()
        vim.diagnostic.goto_next({ border = 'rounded' })
    end)
    buf_keymap('n', '<leader>q', function()
        my_utils.command('TroubleToggle quickfix')
    end) -- setloclist for buffer only
    buf_keymap('n', '<leader>a', vim.lsp.buf.code_action)
    buf_keymap('v', '<leader>a', vim.lsp.buf.code_action)

    create_command('Format', function()
        vim.lsp.buf.format({ async = true })
    end, { bang = true })
end

M.disable_format_on_save = function()
    my_utils.del_augroup('_format_on_save')
end

M.enable_format_on_save = function()
    local _format_on_save = my_utils.augroup('_format_on_save', {})
    my_utils.autocmd('BufWritePre', {
        desc = 'Format document on save',
        buffer = 0,
        group = _format_on_save,
        callback = function()
            vim.lsp.buf.format()
        end,
    })
end

M.toggle_format_on_save = function()
    if vim.fn.exists('#_format_on_save#BufWritePre') == 0 then
        M.enable_format_on_save()
    else
        M.disable_format_on_save()
    end
end

my_utils.create_command('ToggleFormatOnSave', M.toggle_format_on_save, { bang = true })

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    print("keymaps loaded")
    M.enable_format_on_save()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TODO: this crashes yaml lsp
if capabilities.textDocument.foldingRange then
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
    }
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return M
