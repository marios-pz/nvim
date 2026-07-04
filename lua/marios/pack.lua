-- Native package manager (vim.pack, Neovim 0.12+). Replaces lazy.nvim.

-- Build hooks must be registered before the vim.pack.add() calls that
-- trigger them (see :help vim.pack-events).
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		if name == "telescope-fzf-native.nvim" then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		elseif name == "nvim-treesitter" then
			vim.schedule(function()
				vim.cmd("TSUpdate")
			end)
		elseif name == "go.nvim" then
			vim.schedule(function()
				if not ev.data.active then
					vim.cmd.packadd("go.nvim")
				end
				require("go.install").update_all_sync()
			end)
		end
	end,
})

require("marios.plugins.colorscheme")
require("marios.plugins.extra.todo")
require("marios.plugins.extra.zen")
require("marios.plugins.extra.transparent")
require("marios.plugins.nvim-web-devicons")
require("marios.plugins.status")

require("marios.plugins.nvim-treesitter")
require("marios.plugins.nvim-treesitter-text-objects")
require("marios.plugins.telescope")

require("marios.plugins.mason")
require("marios.plugins.blink.cmp")
require("marios.plugins.blink.indent")
require("marios.plugins.blink.pairs")
require("marios.plugins.lspconfig")

require("marios.plugins.bufferline")
require("marios.plugins.lualine")
require("marios.plugins.nvim-tree")
require("marios.plugins.nvim-surround")
require("marios.plugins.dressing")

require("marios.plugins.formatting")
require("marios.plugins.linting")
require("marios.plugins.tools.actions")
require("marios.plugins.tools.dap")
require("marios.plugins.tools.db")
require("marios.plugins.tools.diffview")
require("marios.plugins.tools.toggleterm")
require("marios.plugins.tools.trouble")

require("marios.plugins.extra.discord")
require("marios.plugins.extra.go")
require("marios.plugins.extra.lazygit")
require("marios.plugins.extra.typst")
require("marios.plugins.extra.yaml")
