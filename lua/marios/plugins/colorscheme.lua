vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
})

require("tokyonight").setup({
	style = "storm",
})
vim.cmd([[colorscheme tokyonight-storm]])
