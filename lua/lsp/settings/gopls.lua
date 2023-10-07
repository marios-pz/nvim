local util = require('lspconfig/util')

local settings = {
    filetypes = { 'go', 'gomod', 'gohtmltmpl', 'gotexttmpl' },
    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
    message_level = vim.lsp.protocol.MessageType.Error,
    cmd = {
        'gopls', -- share the gopls instance if there is one already
        '-remote=auto', --[[ debug options ]] --
        -- "-logfile=auto",
        -- "-debug=:0",
        '-remote.debug=:0',
        -- "-rpc.trace",
    },

    flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
    settings = {
        gopls = {
            -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
            -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
            -- not supported
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
                generate = true, -- show the `go generate` lens.
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
            gofumpt = true, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
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
}

return settings
