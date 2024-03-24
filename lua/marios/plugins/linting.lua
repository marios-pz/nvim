return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "flake8" },
            dockerfile = { "hadolint" },
            c = { "cpplint" },
            cpp = { "cpplint" },
            java = { "checkstyle" },
            lua = { "luacheck" },
            go = { "golangci-lint" },
            -- rust = { "clippy" },
            html = { "htmlhint" },
            css = { "stylelint" },
            markdown = { "markdownlint" },
            yaml = { "yamllint" },
            json = { "jsonlint" },
            vim = { "vint" },
            shell = { "shellcheck" },
            makefile = { "checkmake" },
            sh = { "shellcheck" },
            terraform = { "tflint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
