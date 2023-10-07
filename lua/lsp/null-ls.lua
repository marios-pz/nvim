-- FIX:  Remove this deprecated thing

local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local my_utils = require('utils')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local _format_on_save = my_utils.augroup('_format_on_save', {})
null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = _format_on_save, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                desc = 'Format document on save',
                group = _format_on_save,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,

    debug = false,
    sources = {
        formatting.black.with({
            args = { '--stdin-filename', '$FILENAME', '--quiet', '-', '--fast', '--line-length', '79' },
        }),
        formatting.buf,
        -- Lua
        formatting.stylua,


        -- Shell
        formatting.shfmt,
        diagnostics.shellcheck,
        code_actions.shellcheck,
        diagnostics.zsh,

        -- Python
        diagnostics.ruff,
    },
})
