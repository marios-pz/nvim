vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

local lint = require("lint")

lint.linters_by_ft = {
	terraform = { "terraform_validate" },
	tf = { "terraform_validate" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	python = { "mypy" },
	dockerfile = { "hadolint" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	lua = { "luacheck" },
	go = { "golangcilint" },
	html = { "htmlhint" },
	css = { "stylelint" },
	markdown = { "markdownlint" },
	yaml = { "yamllint" },
	json = { "jsonlint" },
	vim = { "vint" },
	shell = { "shellcheck" },
	makefile = { "checkmake" },
	sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		lint.try_lint()
	end,
})
