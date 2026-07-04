vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/cuducos/yaml.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
})

local lualine = require("lualine")

-- configure lualine with modified theme
lualine.setup({
	sections = {
		lualine_x = {
			{
				require("yaml_nvim").get_yaml_key_and_value,
				color = { fg = "#ff9e64" },
			},
			{ "encoding" },
			{ "fileformat" },
			{ "filetype" },
		},
	},
})
