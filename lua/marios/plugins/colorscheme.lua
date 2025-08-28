return {
	-- {
	-- 	"whatyouhide/vim-gotham",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		vim.cmd([[colorscheme gotham]])
	-- 	end,
	-- },
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "storm",
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[set background=dark]])
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- 	opts = ...,
	-- },
}
