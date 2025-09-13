return {
	"williamboman/mason.nvim",
	dependencies = {
		-- "mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
				},
			},
		})

		-- local mason_lspconfig = require("mason-lspconfig")
		-- mason_lspconfig.setup({})

		local tool_installer = require("mason-tool-installer")

		tool_installer.setup({
			ensure_installed = {
				-- Lua
				"lua-language-server",
				"stylua",
				"luacheck",
				"stylelint",

				-- SQL
				"sqlfluff",
				"sqlls",

				-- DevOps
				"yaml-language-server",
				"ansible-language-server",
				"bash-language-server",
				"docker-language-server",
				"docker-compose-language-service",
				"helm-ls",
				"jsonnet-language-server",
				"marksman",

				-- Shell
				"beautysh",
				"shellcheck",
				"bash-debug-adapter",

				-- C++
				-- "clangd",
				-- "clang-format",
				-- "cpplint",
				-- "cpptools",

				-- Python
				"basedpyright",
				"ruff",
				"mypy",
				"black", -- python formatter
				"isort", -- format python imports
				"debugpy",

				-- Golang
				"gopls",
				"go-debug-adapter",
				"golangci-lint",
				"golines",
				"gomodifytags",
				"gotests",
				"gotestsum",
				"gofumpt",
				"goimports",
				"goimports-reviser",
				"iferr",
				"impl",
				"json-to-struct",
				"nilaway",

				-- WEB
				"html-lsp",
				"htmx-lsp",
				"htmlhint",
				"prettier",
				"eslint_d", -- js linter
				"css-lsp",
				"tailwindcss-language-server",
				"json-lsp",
				"emmet-language-server",

				-- Typst
				"tinymist",
				"typstfmt",

				-- DevOps
				"actionlint",
				"gh-actions-language-server",
				"ansible-lint",
				"jsonlint",
				"yamllint",
				"yamlfmt",
				"hadolint",
				"terraform-ls",
				-- terraform
				"tflint",
				"tfsec",
			},
		})
	end,
}
