vim.pack.add({
	"https://github.com/rafamadriz/friendly-snippets",
	-- use a release tag to download pre-built binaries
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

---@module 'blink.cmp'
---@type blink.cmp.Config
require("blink.cmp").setup({
	-- 'default' for mappings similar to built-in completion
	-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
	-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	-- See the full "keymap" documentation for information on defining your own keymap.
	keymap = { preset = "default" },

	completion = {
		ghost_text = {
			enabled = true,
		},
		menu = {
			auto_show = true, -- true for now
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},

	appearance = {
		-- Sets the fallback highlight groups to nvim-cmp's highlight groups
		-- Useful for when your theme doesn't support blink.cmp
		-- Will be removed in a future release
		use_nvim_cmp_as_default = true,
		-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	fuzzy = { implementation = "lua" },

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
