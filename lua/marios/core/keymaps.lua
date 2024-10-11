-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

keymap.set("n", "<leader>hh", "<cmd>Telescope keymaps<CR>", { desc = "Save" })

-- keymap.set(
--     "n",
--     "<leader>tt",
--     "<cmd>ToggleTerm size=40 dir=~/Desktop direction=float name=desktop<CR>",
--     { desc = "Toggle ZenMode" }
-- )

keymap.set("n", "<leader>w", "<cmd>:w!<CR>", { desc = "Save" })
keymap.set("n", "<leader>Q", "<cmd>:qa!<CR>", { desc = "Quit" })
keymap.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close open window" })
keymap.set("n", "<leader>C", "<cmd>silent! execute '%bd|e#|bd#'<CR>", { desc = "Close all windows except this one" })
keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle ZenMode" })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>e", ":Lex | vert resize 60<CR>", { desc = "Open File explorer" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
-- keymap("n", "<C-h>", "<C-w>h")
-- keymap("n", "<C-j>", "<C-w>j")
-- keymap("n", "<C-k>", "<C-w>k")
-- keymap("n", "<C-l>", "<C-w>l")
--
-- local command = vim.api.nvim_command
--
-- -- Window resize
-- keymap("n", "<S-Up>", function()
--     command("resize -2")
-- end)
--
-- keymap("n", "<S-Down>", function()
--     command("resize +2")
-- end)
--
-- keymap("n", "<S-Right>", function()
--     command("vertical resize -2")
-- end)
--
-- keymap("n", "<S-Left>", function()
--     command("vertical resize +2")
-- end)
--
-- -- Navigate buffers
-- keymap("n", "<S-l>", function()
--     command("bnext")
-- end)
-- keymap("n", "<S-h>", function()
--     command("bprevious")
-- end)
--
-- -- Insert --
-- -- Undo break points
-- keymap("i", ",", ",<C-g>u")
-- keymap("i", ".", ".<C-g>u")
-- keymap("i", "!", "!<C-g>u")
-- keymap("i", "?", "?<C-g>u")
--
-- -- Visual --
-- -- Stay in indent mode
-- keymap("v", "<", "<gv")
-- keymap("v", ">", ">gv")
--
-- -- Move text up and down
-- keymap("v", "p", '"_dP')
--
-- -- Visual Block --
-- -- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv")
-- keymap("x", "K", ":move '<-2<CR>gv-gv")
