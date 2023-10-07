local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

local langs = {
    'vim',
    'go',
    'python',
    'c',
    'svelte',
    'java',
    'html',
    'css',
    'javascript',
    'gitcommit',
    'gitignore',
    'typescript',
    'sql',
    'bash',
    'json',
    'toml',
    'yaml',
    'terraform',
    'dockerfile',
    'lua',
    'rust' -- (Written in Rust)
}

configs.setup({
    ensure_installed = langs, -- one of 'all' or a list of languages
    sync_install = true,      -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
        -- user_languagetree = true,
        enable = true,       -- false will disable the whole extension
        disable = { 'css' }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    indent = { enable = true, disable = { 'css' } },
    context_commentstring = {
        enable = true,
        ensure_installed = false,
    },
    autotag = {
        enable = true,
        disable = { 'xml' },
    },
    rainbow = {
        enable = true,
        colors = {
            'Gold',
            'Orchid',
            'DodgerBlue',
        },
        disable = { 'html' },
    },
    playground = {
        enable = true,
    },
})
