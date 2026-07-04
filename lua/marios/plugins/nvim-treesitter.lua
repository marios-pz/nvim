-- Native treesitter (Neovim 0.12+): highlighting, indent, and incremental
-- selection (an/in/]n/[n/]N/[N) are all built into core. nvim-treesitter
-- here is only the parser/query installer (main branch, no more
-- `configs.setup{highlight=...}`).
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	"https://github.com/windwp/nvim-ts-autotag",
})

require("nvim-treesitter").install({
	"json",
	"javascript",
	"tsx",
	"yaml",
	"html",
	"c",
	"cpp",
	"css",
	"go",
	"markdown",
	"markdown_inline",
	"svelte",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"query",
	"diff",
	"python",
	"terraform",
	"xml",
	"git_config",
	"git_rebase",
	"gosum",
	"gowork",
	"gitattributes",
	"csv",
})

require("nvim-ts-autotag").setup({})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("marios-treesitter", { clear = true }),
	callback = function(ev)
		local ok = pcall(vim.treesitter.start, ev.buf)
		if ok then
			vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
