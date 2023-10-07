local status_ok, mason = pcall(require, 'mason')
if not status_ok then
    return
end

local servers = {
    'bashls',
    'lua_ls',
    'jsonls',
    'jdtls',
    'dockerls',
    'docker_compose_language_service',
    'tsserver',
    'yamlls'
}

local settings = {
    ui = {
        icons = {
            package_installed = '◍',
            package_pending = '◍',
            package_uninstalled = '◍',
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
    return
end

lspconfig.pylyzer.setup({
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
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
                matcher = 'fuzzy',
                diagnosticsDelay = '500ms',
                symbolMatcher = 'FastFuzzy',
                symbolStyle = 'Dynamic', -- Dynamic, Full, Package
                gofumpt = true,          -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
                buildFlags = { '-tags', 'integration' },
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
                arrayIndex = 'All', -- "Enable", "Auto", "Disable"
                await = true,
                paramName = 'All',  -- "All", "Literal", "Disable"
                paramType = false,
                semicolon = 'All',  -- "All", "SameLine", "Disable"
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
    }
    ,
})
