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
				"tailwindcss",

				-- Languages
				"clangd",
				"cmake",
				"lua_ls",
				"html",
				"sqlls",
				"jsonls",
				"gopls",
				"emmet_ls",
				"tinymist",
				"jedi_language_server",

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
				"stylelint",
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
				"sqlfluff",

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
				"flake8",

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
