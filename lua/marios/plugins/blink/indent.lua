return {
	"saghen/blink.indent",
	--- @module 'blink.indent'
	--- @type blink.indent.Config
	opts = {
		-- or disable with `vim.g.indent_guide = false` (global) or `vim.b.indent_guide = false` (per-buffer)
		blocked = {
			buftypes = {},
			filetypes = {},
		},

		static = {
			enabled = true,
			char = "▎",
			priority = 1,
			-- specify multiple highlights here for rainbow-style indent guides
			-- highlights = { 'BlinkIndentRed', 'BlinkIndentOrange', 'BlinkIndentYellow', 'BlinkIndentGreen', 'BlinkIndentViolet', 'BlinkIndentCyan' },
			highlights = { "BlinkIndent" },
		},
		scope = {
			enabled = true,
			char = "▎",
			priority = 1024,
			-- set this to a single highlight, such as 'BlinkIndent' to disable rainbow-style indent guides
			-- highlights = { 'BlinkIndent' },
			highlights = {
				"BlinkIndentOrange",
				"BlinkIndentViolet",
				"BlinkIndentBlue",
				-- 'BlinkIndentRed',
				-- 'BlinkIndentCyan',
				-- 'BlinkIndentYellow',
				-- 'BlinkIndentGreen',
			},
			underline = {
				-- enable to show underlines on the line above the current scope
				enabled = false,
				highlights = {
					"BlinkIndentOrangeUnderline",
					"BlinkIndentVioletUnderline",
					"BlinkIndentBlueUnderline",
					-- 'BlinkIndentRedUnderline',
					-- 'BlinkIndentCyanUnderline',
					-- 'BlinkIndentYellowUnderline',
					-- 'BlinkIndentGreenUnderline',
				},
			},
		},
	},
}
