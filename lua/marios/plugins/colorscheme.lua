return {
    {
        "folke/tokyonight.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("tokyonight").setup({
                style = "storm",
            })
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-storm]])
        end,
    },
    {
        "uniwa-community/uniwa.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        dependencies = {
            "rktjmp/lush.nvim",
            version = false, -- testing with last commit
        },
    },
}
