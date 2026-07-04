vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/cappyzawa/telescope-terraform.nvim",
	"https://github.com/ANGkeith/telescope-terraform-doc.nvim",
})

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		path_display = { "truncate " },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("terraform")
telescope.load_extension("terraform_doc")

-- set keymaps
local keymap = vim.keymap -- for conciseness
local builtin = require("telescope.builtin")

keymap.set("n", "<leader>ff", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fr", builtin.oldfiles, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
