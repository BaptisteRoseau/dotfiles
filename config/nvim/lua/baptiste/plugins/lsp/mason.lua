return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- Enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- LSP
        mason_lspconfig.setup({
            ensure_installed = {
                "cssls",
                "emmet_ls",
                "graphql",
                "html",
                "lua_ls",
                "prismals",
                "pyright",
                "rust-analyzer",
                "svelte",
                "tailwindcss",
                "tsserver",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        -- DAP, Formatters, Linters
        -- Requires:
        --      nodejs 21+
        --      python 3.10+
        mason_tool_installer.setup({
            ensure_installed = {
                -- linters
                "ansible-lint",
                "clj-kondo",
                "cmakelint",
                "cspell",
                "eslint_d",
                "hadolint",
                "jsonlint",
                "luacheck",
                "markdownlint",
                "markdownlint-cli2",
                "mypy",
                "pylint",
                "ruff",
                "shellcheck",
                "tflint",
                "yamllint",
                -- formatters
                "beautysh",
                "black",
                "buf",
                "google-java-format",
                "htmlbeautifier",
                "isort",
                "ktlint",
                "prettier",
                "prettierd",
                "stylua",
                "yamlfix",
                -- DAP
                "bash-debug-adapter",
                "cpptools",
                "firefox-debug-adapter",
                "go-debug-adapter",
            },
        })
    end,
}
