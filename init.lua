require("options")
require("utils")
require("plugins")
require("keybinds")
require("autocommands")
require("autopairs")

vim.cmd("colorscheme tokyonight-storm")
require("which")

-- My Modules
require("convenience")
require("lsp")

-- Lazy Loading
require('impatient').enable_profile()
