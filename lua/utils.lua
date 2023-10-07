local M = {}

M.augroup = vim.api.nvim_create_augroup
M.autocmd = vim.api.nvim_create_autocmd

M.create_command = vim.api.nvim_create_user_command
M.command = vim.api.nvim_command -- execute command

M.set_global_option = vim.api.nvim_set_option
M.set_option = vim.api.nvim_set_option_value
M.buf_set_option = function(name, value, bufnr)
    local buffer = bufnr or 0
    vim.api.nvim_buf_set_option(buffer, name, value)
end

M.set_global_variable = vim.api.nvim_set_var

M.keymap = function(mode, lhs, rhs)
    local opts = { silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.buf_keymap = function(mode, lhs, rhs, bufnr)
    local opts = {
        buffer = bufnr or true,
        silent = true,
    }
    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
