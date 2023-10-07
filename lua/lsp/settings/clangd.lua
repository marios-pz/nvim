local opts = {
    cmd = {
        'clangd',
        '--background-index',
        '-j=12',
        '--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++',
        '--clang-tidy',
        '--clang-tidy-checks=*',
        -- '--format-style="{IndentWidth: 4}"',
        '--all-scopes-completion',
        '--cross-file-rename',
        '--completion-style=detailed',
        '--header-insertion-decorators',
        '--header-insertion=iwyu',
        '--pch-storage=memory',
        -- '--enable-config',
    },
    filetypes = {
        'c',
        'cpp',
        'objc',
        'objcpp',
        'cuda',
        --[[ 'proto', ]]
    },
}

return opts
