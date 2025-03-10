-- LSP servers and clients communicate what features they support through "capabilities".
--  By default, Neovim support a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in-general for nvim-lspconfig:
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saghen/blink.cmp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		require("java").setup({
			notifications = {
				dap = true,
			},
			jdk = {
				auto_install = false,
			},
		})

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

			-- finally its build-in
			-- opts.desc = "Go to previous diagnostic"
			-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
			--
			-- opts.desc = "Go to next diagnostic"
			-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
			-- opts.desc = "Show documentation for what is under cursor"
			-- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			-- TODO: is this the right place for it?
			vim.lsp.inlay_hint.enable()

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- NOTE: visit below link to add stuff to lspconfig
		-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		--

		local servers = {
			html = {
				on_attach = on_attach,
			},
			cssls = {
				on_attach = on_attach,
			},
			tailwindcss = {
				on_attach = on_attach,
			},
			tinymist = {
				on_attach = on_attach,
				settings = {
					exportPdf = "onType", -- Choose onType, onSave or never.
					-- serverPath = "" -- Normally, there is no need to uncomment it.
				},
			},
			jdtls = {
				on_attach = on_attach,
				settings = {
					java = {
						configuration = {
							runtimes = {
								{
									name = "JavaSE-17",
									path = os.getenv("JAVA_HOME") or "",
									default = true,
								},
							},
						},
					},
				},
			},
			svelte = {
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)

					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							if client.name == "svelte" then
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
							end
						end,
					})
				end,
			},
			emmet_ls = {
				on_attach = on_attach,
				filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
			},
			jedi_language_server = {
				on_attach = on_attach,
			},
			lua_ls = {
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
						-- turn off telemetry
						telemetry = { enable = false },
					},
				},
			},
			helm_ls = {
				on_attach = on_attach,
			},
			bashls = {
				on_attach = on_attach,
			},
			eslint = {
				on_attach = on_attach,
			},
			jsonnet_ls = {
				on_attach = on_attach,
			},
			jsonls = {
				on_attach = on_attach,
			},
			postgres_lsp = {
				on_attach = on_attach,
			},
			yamlls = {
				on_attach = on_attach,
			},
			terraformls = {
				on_attach = on_attach,
			},
			sqlls = {
				on_attach = on_attach,
			},
			gradle_ls = {
				on_attach = on_attach,
			},
			dockerls = {
				on_attach = on_attach,
			},
			docker_compose_language_service = {
				on_attach = on_attach,
			},
			clangd = {
				on_attach = on_attach,
			},
			gopls = {
				settings = {
					filetypes = { "go", "gomod", "gohtmltmpl", "gotexttmpl" },
					message_level = vim.lsp.protocol.MessageType.Error,
					cmd = {
						"gopls",
						"-remote=auto",
						"-remote.debug=:0",
					},

					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
								unreachable = true,
								nilness = true,
								shadow = true,
								unusedwrite = true,
								useany = true,
								unusedvariable = true,
								nilfunc = true,
								lostcancel = true,
							},
							codelenses = {
								generate = true, -- show the `go generate` lens.
								gc_details = true, --  // Show a code lens toggling the display of gc's choices.
								test = true,
								tidy = true,
							},
							usePlaceholders = false,
							completeUnimported = true,
							staticcheck = true,
							matcher = "fuzzy",
							diagnosticsDelay = "500ms",
							symbolMatcher = "FastFuzzy",
							symbolStyle = "Dynamic", -- Dynamic, Full, Package
							gofumpt = true, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
							buildFlags = { "-tags", "integration" },
							expandWorkspaceToModule = true,
							hints = {
								assignVariableTypes = true,
								constantValues = true,
								parameterNames = true,
							},
							-- buildFlags = {"-tags", "functional"}
						},
					},
				},
			},
		}

		-- Load Capabilities and Setup server
		for server, config in pairs(servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
