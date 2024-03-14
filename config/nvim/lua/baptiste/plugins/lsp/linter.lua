return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint")

        -- Add linters you want to be executed to every file here.
        local always_lint = {}

        lint.linters_by_ft = {
            ansible = { "ansible-lint", "yamllint" },
            bash = { "shellcheck" },
            clojure = { "clj-kondo" },
            cmake = { "cmakelint" },
            dockerfile = { "hadolint" },
            html = { "eslint_d" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            json = { "jsonlint" },
            lua = { "luacheck" },
            markdown = { "markdownlint" },
            python = { "pylint", "ruff", "mypy" },
            svelte = { "eslint_d" },
            terraform = { "tflint" },
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            yaml = { "yamllint" },
        }

        for _, linter_name in pairs(always_lint) do
            for language, _ in pairs(lint.linters_by_ft) do
                table.insert(lint.linters_by_ft[language], linter_name)
            end
        end

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        -- No need to add another event when autosave is enabled
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", lint.try_lint, { desc = "[L]int current file" })
    end,
}
