-- local path = require("mason-core.path")
-- local install_root_dir = path.concat({ vim.fn.stdpath("data"), "mason" })
-- local icons = require("icons")

local settings = {
	disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
	-- settings with {}
	go = "go", -- go command, can be go[default] or go1.18beta1
	goimports = "gopls", -- goimport command, can be gopls[default] or goimport
	fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls
	gofmt = "gofumpt", --gofmt cmd,
	-- max_line_len = 100, -- max line length in golines format, Target maximum line length for golines
	tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
	gotests_template = "", -- sets gotests -template parameter (check gotests for details)
	gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
	comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
	icons = true,
	verbose = false, -- output loginf in messages
	lsp_cfg = true, -- true: use non-default gopls setup specified in go/lsp.lua
	-- false: do nothing
	-- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
	--   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
	lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
	-- lsp_on_attach = require("lsp.handlers").on_attach, -- nil: use on_attach function defined in go/lsp.lua,
	--      when lsp_cfg is true
	-- if lsp_on_attach is a function: use this function as on_attach function for gopls
	lsp_keymaps = false, -- set to false to disable gopls/lsp keymap
	lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
	-- function(bufnr)
	--    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
	-- end
	-- virtual text setup
	-- lsp_diag_virtual_text = { space = 0, prefix = icons.ui.CircleDot },

	-- set to true: use gopls to format
	-- false if you want to use other formatter tool(e.g. efm, nulls)
	lsp_inlay_hints = {
		enable = true,
		-- Only show inlay hints for the current line
		only_current_line = false,
		-- Event which triggers a refersh of the inlay hints.
		-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
		-- not that this may cause higher CPU usage.
		-- This option is only respected when only_current_line and
		-- autoSetHints both are true.
		only_current_line_autocmd = "CursorHold",
		-- whether to show variable name before type hints with the inlay hints or not
		-- default: false
		show_variable_name = true,
		-- prefix for parameter hints
		-- parameter_hints_prefix = icons.ui.Function,
		show_parameter_hints = true,
		-- prefix for all the other hints (type, chaining)
		other_hints_prefix = "=> ",
		-- whether to align to the lenght of the longest line in the file
		max_len_align = false,
		-- padding from the left if max_len_align is true
		max_len_align_padding = 1,
		-- whether to align to the extreme right or not
		right_align = false,
		-- padding from the right if right_align is true
		right_align_padding = 6,
		-- The color of the hints
		highlight = "Comment",
	},
	-- gopls_cmd = { install_root_dir .. "/bin/gopls" }, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
	gopls_remote_auto = true, -- add -remote=auto to gopls
	gocoverage_sign = "█",
	sign_priority = 5, -- change to a higher number to override other signs
	dap_debug = false, -- set to false to disable dap
	dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
	-- false: do not use keymap in go/dap.lua.  you must define your own.
	-- windows: use visual studio keymap
	dap_debug_gui = true, -- set to true to enable dap gui, highly recommend
	dap_debug_vt = true, -- set to true to enable dap virtual text
	build_tags = "tag1,tag2", -- set default build tags
	textobjects = true, -- enable default text jobects through treesittter-text-objects
	test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
	verbose_tests = true, -- set to add verbose flag to tests
	run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
	-- float term recommend if you use richgo/ginkgo with terminal color

	trouble = true, -- true: use trouble to open quickfix
	test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
	luasnip = false, -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
}

return {
	"ray-x/go.nvim",
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"leoluz/nvim-dap-go",
	},
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	config = function()
		require("go").setup(settings)
		require("dap-go").setup()
	end,
}
