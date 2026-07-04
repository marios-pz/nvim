vim.pack.add({
	-- download prebuilt binaries from github releases
	"https://github.com/saghen/blink.download",
	{ src = "https://github.com/saghen/blink.pairs", version = vim.version.range("*") },
})

-- v0.6+ requires the native library to be downloaded/built manually
-- when not using lazy.nvim's `build` hook
require("blink.pairs").download():pwait(60000)

--- @module 'blink.pairs'
--- @type blink.pairs.Config
require("blink.pairs").setup({
	mappings = {
		-- you can call require("blink.pairs.mappings").enable()
		-- and require("blink.pairs.mappings").disable()
		-- to enable/disable mappings at runtime
		enabled = true,
		-- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
		-- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
		disabled_filetypes = {},
		-- see the defaults:
		-- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
		pairs = {},
	},
	highlights = {
		enabled = true,
		-- requires require('vim._extui').enable({}), otherwise has no effect
		groups = {
			"BlinkPairsOrange",
			"BlinkPairsPurple",
			"BlinkPairsBlue",
		},

		-- highlights matching pairs under the cursor
		matchparen = {
			enabled = true,
			-- known issue where typing won't update matchparen highlight, disabled by default
			group = "BlinkPairsMatchParen",
		},
	},
	debug = false,
})
