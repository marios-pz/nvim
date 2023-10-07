vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4


local utils = require('utils')
local set_global_variable = utils.set_global_variable
local command = utils.command
local keymap = utils.keymap

set_global_variable("code_action_menu_show_details", false)
set_global_variable("code_action_menu_show_diff", false)

-- Set Space as leader key
keymap("", "<Space>", "<Nop>")
set_global_variable("mapleader", " ")
set_global_variable("maplocalleader", " ")

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Window resize
keymap("n", "<S-Up>", function()
    command("resize -2")
end)

keymap("n", "<S-Down>", function()
    command("resize +2")
end)

keymap("n", "<S-Right>", function()
    command("vertical resize -2")
end)

keymap("n", "<S-Left>", function()
    command("vertical resize +2")
end)

-- Navigate buffers
keymap("n", "<S-l>", function()
    command("bnext")
end)
keymap("n", "<S-h>", function()
    command("bprevious")
end)

-- Insert --
-- Undo break points
keymap("i", ",", ",<C-g>u")
keymap("i", ".", ".<C-g>u")
keymap("i", "!", "!<C-g>u")
keymap("i", "?", "?<C-g>u")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move text up and down
keymap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")


-- Leader + Number (1..9)
for l = 1, 10, 1 do
    keymap("n", "<leader>" .. l, function()
        require("bufferline").go_to_buffer(l, true)
    end)
end


local nkeymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Debugger
nkeymap("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", opts)   --it also starts the execution in debug mode
nkeymap("n", "<leader>e", "<cmd>Lex<cr>:vertical resize 30<cr>", opts) --it also starts the execution in debug mode

nkeymap("n", "<S-F5>", "<cmd>lua require('dap').terminate()<CR>", opts)

--TODO: map  F29 (= C-F5 to either 'run without debugger'  or 'restart debugger')
nkeymap("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>", opts)
nkeymap("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>", opts)
nkeymap("n", "<F22>", "<cmd>lua require('dap').step_out()<CR>", opts) --F22 -> S-F11
nkeymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
nkeymap("n", "<leader>B", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
nkeymap(
    "n",
    "<leader>lp",
    "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
    opts
)
nkeymap("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", opts)
nkeymap("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", opts)
