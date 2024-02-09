return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "lua_ls",
                "graphql",
                "jedi-language-server",
                "gopls",
                "stylua",
                "rust-analyzer",
                "htmx-lsp",
                "sqlls",
                "docker-compose-language-service",
                "clangd",
                "json-lsp",
                "terraform-ls",
                "helm-ls",
                "json-lsp",
                "bash-language-server",
                "dockerfile-language-server",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua", -- lua formatter
                "ruff", -- python formatter
                "eslint_d", -- js linter
                "cpplint",
                "cpptools",
                "debugpy",
                "beautysh",
                "shellcheck",
                "hadolint",
                "go-debug-adapter",
            },
        })
    end,
}
