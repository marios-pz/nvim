local my_utils = require("utils")

local augroup = my_utils.augroup
local autocmd = my_utils.autocmd
local command = my_utils.command
local set_global_option = my_utils.set_global_option
local set_option = my_utils.set_option
local buf_keymap = my_utils.buf_keymap

---------------------------------------------------------------------
local _general_settings = augroup("_general_settings", {})
autocmd("FileType", {
	desc = "These filetypes will close with q",
	group = _general_settings,
	pattern = { "qf", "help", "man", "lspinfo", "null-ls-info", "sqls_output" },
	callback = function()
		buf_keymap("n", "q", function()
			vim.api.nvim_win_close(0, false)
		end)
	end,
})

autocmd("FileType", { --depends on bufferline.nvim
	desc = "Cheakhealth filetypes will close with q",
	group = _general_settings,
	pattern = "checkhealth",
	callback = function()
		buf_keymap("n", "q", "<cmd>Bdelete!<CR>")
	end,
})

autocmd("FileType", {
	desc = "Dap-float filetypes will close with Esc",
	group = _general_settings,
	pattern = "dap-float",
	callback = function()
		buf_keymap("n", "<Esc>", function()
			vim.api.nvim_win_close(0, false)
		end)
	end,
})

autocmd("TextYankPost", {
	desc = "Highlights text on yank(copy)",
	group = _general_settings,
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
})

autocmd("BufWinEnter", {
	desc = "TODO: understand and describe this one",
	group = _general_settings,
	callback = function()
		vim.opt.formatoptions:remove("cro")
	end,
})

autocmd("FileType", {
	desc = "Quickfix files will not be listed in bufferlist",
	group = _general_settings,
	pattern = "qf",
	callback = function()
		command("set nobuflisted")
	end,
})

autocmd("FileType", {
	desc = "Help opens in vertical split",
	group = _general_settings,
	pattern = "help",
	callback = function()
		command("wincmd L")
		command("vert resize 90")
	end,
})

---------------------------------------------------------------------
local _git = augroup("_git", {})
autocmd("FileType", {
	desc = "Setting for gitcommit files",
	group = _git,
	pattern = "gitcommit",
	callback = function()
		set_option("wrap", true, { scope = "local" })
		set_option("spell", true, { scope = "local" })
	end,
})

---------------------------------------------------------------------
local _markdown = augroup("_markdown", {})
autocmd("FileType", {
	desc = "Settings for markdown files",
	group = _markdown,
	pattern = "markdown",
	callback = function()
		set_option("wrap", true, { scope = "local" })
		set_option("spell", true, { scope = "local" })
	end,
})

---------------------------------------------------------------------
local _auto_resize = augroup("_auto_resize", {})
autocmd("VimResized", {
	desc = "",
	group = _auto_resize,
	callback = function()
		command("tabdo wincmd =")
	end,
})

---------------------------------------------------------------------
local _codelens = augroup("_codelens", {})
autocmd("BufWritePost", {
	desc = "Refresh codelens virtual text after file saves",
	group = _codelens,
	pattern = "*.java",
	callback = function()
		vim.lsp.codelens.refresh()
	end,
})

---------------------------------------------------------------------
local _sql = augroup("_sql", {})
autocmd("FileType", {
	desc = "Mappings for sql files",
	group = _sql,
	pattern = "sql",
	callback = function()
		buf_keymap("n", "<leader>a", vim.lsp.buf.code_action)
		buf_keymap("v", "<leader>a", vim.lsp.buf.code_action)
		buf_keymap("n", "<F5>", "<Plug>(sqls-execute-query)")
		buf_keymap("v", "<F5>", "<Plug>(sqls-execute-query)")
	end,
})

autocmd("FileType", {
	desc = "Sql output filetype opens in vertical split",
	group = _sql,
	pattern = "sqls_output",
	callback = function()
		command("wincmd L")
	end,
})

-- Golang
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
