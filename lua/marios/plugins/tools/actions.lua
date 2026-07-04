vim.pack.add({
	"https://github.com/aznhe21/actions-preview.nvim",
})

vim.keymap.set({ "v", "n" }, "<leader>ga", require("actions-preview").code_actions)
