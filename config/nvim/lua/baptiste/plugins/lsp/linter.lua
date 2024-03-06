return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            ansible = { "ansible_lint" },
            bash = { "shellcheck" },
            c = { "clangtidy" },
            clojure = { "clj-kondo" },
            cmake = { "cmakelint" },
            cpp = { "cppcheck" },
            dockerfile = { "hadolint" },
            html = { "tidy" },
            inko = { "inko" },
            janet = { "janet" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            json = { "jsonlint" },
            lua = { "luacheck" },
            markdown = { "mardownlint" },
            python = { "pylint", "ruff", "mypy" },
            rst = { "vale" },
            ruby = { "ruby" },
            svelte = { "eslint_d" },
            terraform = { "tflint" },
            text = { "vale" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            yaml = { "yamllint" },
        }

        local always_lint = { "cspell" }
        for _, linter_name in pairs(always_lint) do
            for language, _ in pairs(lint.linters_by_ft) do
                table.insert(lint.linters_by_ft[language], linter_name)
            end
        end

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", lint.try_lint, { desc = "[L]int current file" })
    end,
}
