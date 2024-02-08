return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local keymap = vim.keymap
        local dap_cmd = "lua require('dap')"

        keymap.set("n", "<leader>db", "<cmd>" .. dap_cmd .. ".toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
        keymap.set(
            "n",
            "<leader>dr",
            "<cmd>" .. dap_cmd .. ".repl.toggle({}, 'vsplit')<cr><C-W>l",
            { desc = "Debugger REPL" }
        )
        keymap.set("n", "<leader>dl", "<cmd>" .. dap_cmd .. ".run_last()<cr>", { desc = "Exit" })
        keymap.set("n", "<leader>dh", "<cmd>" .. dap_cmd .. ".ui.widgets.hover()<cr>", { desc = "Hover" })
        keymap.set("n", "<leader>dc", "<cmd>" .. dap_cmd .. ".run_to_cursor()<cr>", { desc = "Run to cursor" })
        keymap.set("n", "<leader>dC", "<cmd>" .. dap_cmd .. ".clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
        keymap.set("n", "<leader>dk", "<cmd>" .. dap_cmd .. ".up()<cr>", { desc = "Move arrow up" })
        keymap.set("n", "<leader>dj", "<cmd>" .. dap_cmd .. ".down()<cr>", { desc = "Move arrow down" })
        keymap.set(
            "n",
            "<leader>dL",
            "<cmd>" .. dap_cmd .. ".set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
            { desc = "Breakpoint log message" }
        )
        keymap.set(
            "n",
            "<leader>de",
            "<cmd>" .. dap_cmd .. ".set_exception_breakpoints({ 'all' })<cr>",
            { desc = "Exception breakpoint" }
        )
        keymap.set("n", "<leader>da", "<cmd>" .. dap_cmd .. ".require('debugHelper').attach()<cr>", { desc = "Attach" })
        keymap.set("n", "<leader>du", "<cmd>" .. dap_cmd .. ".require('dapui').toggle()<cr>", { desc = "UI" })
        keymap.set(
            "n",
            "<leader>d?",
            "<cmd>" .. dap_cmd .. ".require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>",
            { desc = "widgets?????" }
        )
    end,
}
