require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "rust",
        "html",
        "css",
        "scss",
        "javascript",
        "java",
        "markdown",
        "yaml",
        "terraform",
        "lua",
        "json",
        "graphql",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "csv",
        "sql",
        "svelte",
        "toml",
        "xml"
    },

    sync_install = false,

    auto_install = true,

    ignore_install = {},

    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
