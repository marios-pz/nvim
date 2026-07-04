vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/mfussenegger/nvim-dap-python",
	"https://github.com/nvim-neotest/nvim-nio",
})

local keymap = vim.keymap

keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
keymap.set(
	"n",
	"<leader>dr",
	"<cmd> lua require('dap').repl.toggle({}, 'vsplit')<cr><C-W>l",
	{ desc = "Debugger REPL" }
)
keymap.set("n", "<leader>dl", "<cmd> lua require('dap').run_last()<cr>", { desc = "Exit" })
keymap.set("n", "<leader>dh", "<cmd> lua require('dap').ui.widgets.hover()<cr>", { desc = "Hover" })
keymap.set("n", "<leader>dc", "<cmd> lua require('dap').run_to_cursor()<cr>", { desc = "Run to cursor" })
keymap.set("n", "<leader>dC", "<cmd> lua require('dap').clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
keymap.set("n", "<leader>dk", "<cmd> lua require('dap').up()<cr>", { desc = "Move arrow up" })
keymap.set("n", "<leader>dj", "<cmd> lua require('dap').down()<cr>", { desc = "Move arrow down" })
keymap.set(
	"n",
	"<leader>dL",
	"<cmd> lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
	{ desc = "Breakpoint log message" }
)
keymap.set(
	"n",
	"<leader>de",
	"<cmd> lua require('dap').set_exception_breakpoints({ 'all' })<cr>",
	{ desc = "Exception breakpoint" }
)
keymap.set("n", "<leader>da", "<cmd> lua require('dap').require('debugHelper').attach()<cr>", { desc = "Attach" })
keymap.set("n", "<leader>du", "<cmd>lua require('dap').require('dapui').toggle()<cr>", { desc = "UI" })
keymap.set(
	"n",
	"<leader>d?",
	"<cmd> lua require('dap').require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>",
	{ desc = "widgets?????" }
)
