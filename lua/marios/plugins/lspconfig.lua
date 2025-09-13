-- LSP servers and clients communicate what features they support through "capabilities".
--  By default, Neovim support a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in-general for nvim-lspconfig:
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function(_, opts)
		local keymap = vim.keymap -- for conciseness

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr
			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart renamehelm

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			-- TODO: is this the right place for it?
			vim.lsp.inlay_hint.enable()
			vim.o.winborder = "rounded"
			vim.diagnostic.config({
				virtual_text = false,
			})

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- NOTE: visit below link to add stuff to lspconfig
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		local servers = {
			html = {},
			cssls = {},
			tailwindcss = {},
			tinymist = {
				settings = {
					exportPdf = "onType", -- Choose onType, onSave or never.
					-- serverPath = "" -- Normally, there is no need to uncomment it.
				},
			},

			emmet_ls = {
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			},
			basedpyright = {},
			lua_ls = {},
			helm_ls = {},
			bashls = {},
			eslint = {},
			jsonnet_ls = {},
			jsonls = {},
			postgres_lsp = {},
			yamlls = {},
			terraformls = {},
			sqlls = {},
			gradle_ls = {},
			dockerls = {},
			docker_compose_language_service = {},
			clangd = {},
			gdscript = {},
			gopls = {},
		}
		local lspconfig = require("lspconfig")
		-- Load Capabilities and Setup server
		for server, config in pairs(servers) do
			config.on_attach = on_attach
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
