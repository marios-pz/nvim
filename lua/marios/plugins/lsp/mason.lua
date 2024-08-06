return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- CSS
				"cssls",
				"cssmodules_ls",
				"unocss",
				"als",
				"tailwindcss",
				-- Languages
				"clangd",
				"cmake",
				"lua_ls",
				"html",
				"jedi_language_server",
				"tsserver",
				"sqlls",
				"jsonls",
				"golangci_lint_ls",
				"gopls",
				"emmet_ls",
				"typst_lsp",

				-- DevOps
				"yamlls",
				"ansiblels",
				"bashls",
				"dockerls",
				"docker_compose_language_service",
				"helm_ls",
				"jsonnet_ls",
				"marksman",
				"terraformls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- BASE
				"stylua",
				"luacheck",
				"gdtoolkit",

				-- Shell
				"beautysh",
				"shellcheck",
				"bash-debug-adapter",

				-- C++
				"clang-format",
				"cpplint",
				"cpptools",

				-- Python
				"black", -- python formatter
				"isort", -- format python imports
				"debugpy",

				-- Golang
				"go-debug-adapter",

				-- WEB
				"htmlhint",
				"prettier",
				"eslint_d", -- js linter

				-- Other
				"typstfmt",
				"checkstyle",

				-- DevOps
				"actionlint",
				"ansible-lint",
				"jsonlint",
				"yamllint",
				"yamlfmt",
				"hadolint",
				"tflint",
			},
		})
	end,
}
