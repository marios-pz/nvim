vim.pack.add({
	"https://github.com/2kabhishek/nerdy.nvim",
	"https://github.com/stevearc/dressing.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("nvim-web-devicons").set_icon({
	gql = {
		icon = "",
		color = "#e535ab",
		cterm_color = "199",
		name = "GraphQL",
	},
})
