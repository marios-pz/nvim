-- LSP servers and clients communicate what features they support through "capabilities".
--  By default, Neovim support a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- Server configs (cmd/filetypes/root_markers) live in ./lsp/*.lua on the
-- config runtimepath and are picked up automatically by vim.lsp.enable().
vim.pack.add({
	"https://github.com/saghen/blink.cmp",
	"https://github.com/antosha417/nvim-lsp-file-operations",
})

require("lsp-file-operations").setup()

local opts = {}
local keymap = vim.keymap -- for conciseness
local icons = require("marios.settings.icons")
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
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = icons.diagnostic.error,
				[vim.diagnostic.severity.WARN] = icons.diagnostic.warn,
			},
			linehl = {
				[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			},
			numhl = {
				[vim.diagnostic.severity.WARN] = "WarningMsg",
			},
		},
	})

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", function()
		for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
			client:stop()
		end
		vim.schedule(function()
			vim.cmd.edit()
		end)
	end, opts) -- stop LSP clients attached to this buffer, then reload to re-attach
end

-- NOTE: server configs live in ./lsp/<name>.lua (see :h lsp-quickstart).
-- Add a new server by dropping a config file there, then listing its name below.
local servers = {
	"html",
	"cssls",
	"tailwindcss",
	"tinymist",
	"emmet_ls",
	"basedpyright",
	"lua_ls",
	"helm_ls",
	"bashls",
	"eslint",
	"jsonnet_ls",
	"jsonls",
	"postgres_lsp",
	"yamlls",
	"terraformls",
	"sqlls",
	"gradle_ls",
	"dockerls",
	"docker_compose_language_service",
	"clangd",
	"gdscript",
	"gopls",
}

for _, server in ipairs(servers) do
	-- Some server configs (e.g. tinymist, eslint, clangd) define their own
	-- on_attach; wrap it instead of clobbering it, since vim.lsp.config merges
	-- with tbl_deep_extend("force"), which replaces function values outright.
	local base_on_attach = vim.lsp.config[server] and vim.lsp.config[server].on_attach
	vim.lsp.config(server, {
		on_attach = function(client, bufnr)
			if base_on_attach then
				base_on_attach(client, bufnr)
			end
			on_attach(client, bufnr)
		end,
	})
	vim.lsp.enable(server)
end
