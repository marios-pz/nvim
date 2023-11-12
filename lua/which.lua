local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local setup = {
    plugins = { marks = true, registers = true },
    -- add operators that will trigger motion and text object completion
    operators = { gc = "Comments" },
    key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "†", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 15 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 12,                   -- spacing between columns
        align = "left",                 -- align columns left, center or right
    },
    ignore_missing = true,              -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,                   -- show help message on the command line when the popup is visible
    triggers = { "<leader>" },
    triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },
}

function Bind(command, name)
    return { "<cmd>" .. command .. "<CR>", name }
end

function RunBind(lib, func, name)
    return Bind("lua require'" .. lib .. "'." .. func, name)
end

local mappings = {
    w = Bind("w!", "Save"),
    Q = Bind("qa!", "Quit"),
    c = Bind("bdelete", "Close Buffer"),
    C = Bind('silent! execute "%bd|e#|bd#"', "Close all buffers but this"),
    a = Bind("CodeActionMenu", "Code Actions"),
    q = Bind("TroubleToggle", "Quickfix"),
    F = Bind("Telescope live_grep theme=ivy", "Find Text"),
    g = Bind("LazyGit", "LazyGit"),
    f = RunBind('telescope.builtin', "find_files(require('telescope.themes').get_dropdown({previewer = false}))",
        "Find Files"),
    b = RunBind('telescope.builtin', "buffers(require('telescope.themes').get_dropdown{previewer = false})",
        "Buffers"),
    t = Bind(":TodoTelescope", "Look at TODO"),
    r = {
        function()
            require('renamer').rename({ empty = false })
        end,
        'Rename',
    },
    u = {
        function()
            require("neotest").run.run()
        end,
        'Rename',
    },



    d = {
        name = 'Debugging',
        s = {
            function()
                require("convenience.dap")
            end,
            'Start Dap',
        },
        b = {
            function()
                require('dap').toggle_breakpoint()
            end,
            'Breakpoint',
        },
        r = { "<cmd>lua require'dap'.repl.toggle({}, 'vsplit')<cr><C-W>l", 'Repl' },
        l = {
            function()
                require('dap').run_last()
            end,
            'Exit',
        },
        h = {
            function()
                require('dap.ui.widgets').hover()
            end,
            'Hover',
        },
        c = {
            function()
                require('dap').run_to_cursor()
            end,
            'Run to cursor',
        },
        C = {
            function()
                require('dap').clear_breakpoints()
            end,
            'Clear breakpoints',
        },
        k = {
            function()
                require('dap').up()
            end,
            'Move arrow up',
        },
        j = {
            function()
                require('dap').down()
            end,
            'Move arrow down',
        },
        L = {
            function()
                require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
            end,
            'breakpoint log message',
        },
        e = {
            function()
                require('dap').set_exception_breakpoints({ 'all' })
            end,
            'exception breakpoint',
        },
        a = {
            function()
                require('debugHelper').attach()
            end,
            'Attach',
        },
        A = {
            function()
                require('debugHelper').attachToRemote()
            end,
            'Attach to remote',
        },
        u = {
            function()
                require('dapui').toggle()
            end,
            'UI',
        },
        ['?'] = {
            function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end,
            'widgets?????',
        },
    },
    h = {
        name = "Harpoon",
        h = RunBind("harpoon.ui", "toggle_quick_menu()", "Harpoon"),
        m = RunBind("harpoon.mark", "add_file()", "Mark"),
        t = Bind("Telescope harpoon marks", "Telescope"),
        n = RunBind("require('harpoon.ui')", "nav_next()", "Next"),
        p = RunBind("require('harpoon.ui')", "nav_prev()", "Previous"),
    },
    D = {
        name = "Diff",
        l = Bind("DiffviewLog", "Log Diff"),
        o = Bind("DiffviewOpen", "Open Diff"),
        c = Bind("DiffviewClose", "Close Diff"),
        t = Bind("DiffviewToggleFiles", "Toggle Files"),
        f = Bind("DiffviewFileHistory", "File History"),
        F = Bind("DiffviewFocusFiles", "Focus Files"),
    },
    s = {
        name = 'Search',
        c = Bind("Telescope colorscheme", "Colorscheme"),
        h = Bind("Telescope help_tags", "Find help"),
        M = Bind("Telescope man_pages", "Man pages"),
        r = Bind("Telescope oldfiles", "Open recent file"),
        R = Bind("Telescope registers", "Registers"),
        k = Bind("Telescope keymaps", "Keymaps"),
        C = Bind("Telescope commands", "Commands"),
    },
    m = {
        name = "Mason",
        m = Bind("Mason", "Mason"),
        l = Bind("MasonLog", "Mason"),
    },

    l = {
        name = "LSP",
        d = Bind("Telescope lsp_document_diagnostics", "Document Diagnostics"),
        w = Bind("Telescope lsp_workspace_diagnostics", "Workspace Diagnostics"),
        s = Bind("Telescope lsp_document_symbols", "Document Symbols"),
        S = Bind("Telescope lsp_dynamic_workspace_symbols", "Workspace Symbols"),
        i = Bind("LspInfo", "Info"),
        a = Bind("lua vim.lsp.buf.code_action()", "Code Action"),
        f = Bind("lua vim.lsp.buf.format({ async = true ))", "Format"),
        j = Bind("lua vim.lsp.diagnostic.goto_next()", "Next Diagnostic"),
        k = Bind("lua vim.lsp.diagnostic.goto_prev()", "Prev Diagnostic"),
        l = Bind("lua vim.lsp.codelens.run()", "CodeLens Action"),
        q = Bind("lua vim.diagnostic.setloclist()", "Quickfix"),
        r = Bind("lua vim.lsp.buf.rename()", "Rename"),
    },

}

local vopts = {
    mode = "v",     -- VISUAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local vmappings = {
    ["/"] = Bind(
        '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
        "Comment"
    ),
}

wk.setup(setup)
wk.register(mappings, opts)
wk.register(vmappings, vopts)
