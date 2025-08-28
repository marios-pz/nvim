return {
	"williamboman/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
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

		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({})

		local tool_installer = require("mason-tool-installer")

		tool_installer.setup({
			ensure_installed = {
				-- Lua
				"lua_ls",
				"stylua",
				"luacheck",
				"stylelint",

				-- SQL
				"sqlfluff",
				"sqlls",

				-- DevOps
				"yamlls",
				"ansiblels",
				"bashls",
				"dockerls",
				"docker_compose_language_service",
				"helm_ls",
				"jsonnet_ls",
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
				"html",
				"htmlhint",
				"prettier",
				"eslint_d", -- js linter
				"cssls",
				"tailwindcss",
				"jsonls",
				"emmet_ls",

				-- Typst
				"tinymist",
				"typstfmt",

				-- DevOps
				"actionlint",
				"ansible-lint",
				"jsonlint",
				"yamllint",
				"yamlfmt",
				"hadolint",
				"terraformls",
				"tflint",
				"tfsec",
			},
		})
	end,
}
