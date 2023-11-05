return {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                useLibraryCodeForTypes = true,
                reportMissingTypeStubs = true,
                diagnosticMode = "workspace",
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                },
            },
        },
    },
}
