local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
          vim.cmd([[colorscheme tokyonight-storm]])
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "ray-x/lsp_signature.nvim",
            "neovim/nvim-lspconfig",
        },
    },

    {
        "mfussenegger/nvim-dap",
        event = "InsertEnter",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
        },
    },
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
        },
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
    },

    {
        "nvim-neotest/neotest",
        event = "InsertEnter",
        dependencies = {
            "nvim-neotest/neotest-go",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim"
        },
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
        event = "VeryLazy",
    },
    {
        'weilbith/nvim-code-action-menu',
        event = "InsertEnter",
        cmd = 'CodeActionMenu',
    },

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        event = "VeryLazy",
    },
    { "folke/trouble.nvim", lazy = true, event = "VeryLazy" },
    { "folke/which-key.nvim", lazy = true, event = "VeryLazy" },
    { "williamboman/mason.nvim", lazy = true, event = "VeryLazy" },
    { "nvim-telescope/telescope.nvim", lazy = true, event = "VeryLazy" },
    { "nvim-lua/plenary.nvim", lazy = true, event = "VeryLazy" },
    { 'sindrets/diffview.nvim',lazy = true, event = "VeryLazy" },
    { "windwp/nvim-autopairs", lazy = true},
    { "tpope/vim-surround", lazy = true },
    { "rafamadriz/friendly-snippets", lazy = true, event = "VeryLazy" },
    { "L3MON4D3/LuaSnip", lazy = true },
    { "nvim-lualine/lualine.nvim", lazy = true },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        lazy = true
    },
    {
        "ThePrimeagen/harpoon",
        event = "InsertEnter",
        lazy = true
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
