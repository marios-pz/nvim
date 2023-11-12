local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local settings = {
    ui = {
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)

local servers = {
    "lua_ls",
    "rust_analyzer",
    "azure_pipelines_ls",
    "helm_ls",
    "bash-language-server",
    "eslint",
    "html",
    "cssls",
    "jsonnet_ls",
    "jdtls",
    "gopls",
    "jsonls",
    "dockerls",
    "docker_compose_language_service",
    "pyright",
    "clangd"
}


require("mason-lspconfig").setup {
    ensure_installed = servers,
}

local prettier = require("prettier")

prettier.setup({
    bin = "prettier",
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
    },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

lspconfig.azure_pipelines_ls.setup {
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                    "/azure-pipeline*.y*l",
                    "/*.azure*",
                    "Azure-Pipelines/**/*.y*l",
                    "Pipelines/*.y*l",
                },
            },
        },
    },
}

lspconfig.helm_ls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.bashls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.html.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.jsonnet_ls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.jsonls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.matlab_ls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.nginx_language_server.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.postgres_lsp.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.powershell_es.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    -- bundle_path = 'c:/w/PowerShellEditorServices',
})

lspconfig.html.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.rust_analyzer.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
            }
        }
    }
})

lspconfig.gdscript.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.yamlls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.vuels.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.vimls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.terraform_lsp.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.svelte.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.sqlls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.groovyls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.gradle_ls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.dockerls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.docker_compose_language_service.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.cssls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.asm_lsp.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.jdtls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})


lspconfig.graphql.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
})

lspconfig.pyright.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    settings = require("lsp.settings.python"),
})

lspconfig.gopls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    settings = {
        filetypes = { "go", "gomod", "gohtmltmpl", "gotexttmpl" },
        message_level = vim.lsp.protocol.MessageType.Error,
        cmd = {
            "gopls",
            "-remote=auto",
            "-remote.debug=:0",
        },

        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    unreachable = true,
                    nilness = true,
                    shadow = true,
                    unusedwrite = true,
                    useany = true,
                    unusedvariable = true,
                    nilfunc = true,
                    lostcancel = true,
                },
                codelenses = {
                    generate = true,   -- show the `go generate` lens.
                    gc_details = true, --  // Show a code lens toggling the display of gc's choices.
                    test = true,
                    tidy = true,
                },
                usePlaceholders = false,
                completeUnimported = true,
                staticcheck = true,
                matcher = "fuzzy",
                diagnosticsDelay = "500ms",
                symbolMatcher = "FastFuzzy",
                symbolStyle = "Dynamic", -- Dynamic, Full, Package
                gofumpt = true,          -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
                buildFlags = { "-tags", "integration" },
                expandWorkspaceToModule = true,
                hints = {
                    assignVariableTypes = true,
                    constantValues = true,
                    parameterNames = true,
                },
                -- buildFlags = {"-tags", "functional"}
            },
        },
    },
})

lspconfig.lua_ls.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    settings = {
        Lua = {
            format = {
                enable = true,
            },
            hint = {
                enable = true,
                arrayIndex = "All", -- "Enable", "Auto", "Disable"
                await = true,
                paramName = "All",  -- "All", "Literal", "Disable"
                paramType = false,
                semicolon = "All",  -- "All", "SameLine", "Disable"
                setType = true,
            },
            diagnostics = {
                globals = { "vim", "use", "require", "pcall", "pairs" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
