return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				svelte = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				go = { "goimports", "gofmt" },
				terraform = { "terraform_fmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				java = { "google-java-format" },
				rust = { "rustfmt", lsp_format = "fallback" },
				shell = { "beautysh" },
				sh = { "beautysh" },
				sql = { "sqlfluff" },
			},

			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			format_after_save = {
				lsp_format = "fallback",
			},
			-- Conform will notify you when a formatter errors
			notify_on_error = false,
			-- Conform will notify you when no formatters are available for the buffer
			notify_no_formatters = true,
		})
	end,
}
