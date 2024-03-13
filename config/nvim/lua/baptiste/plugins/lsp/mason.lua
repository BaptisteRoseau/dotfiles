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
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                "lua_ls",
                "graphql",
                "emmet_ls",
                "prismals",
                "pyright",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        -- DAP, Formatters, Linters
        -- Requires:
        --      nodejs 21+
        --      gem 3.3+
        --      python 3.10+
        mason_tool_installer.setup({
            ensure_installed = {
                "ansible-lint",
                "bash-debug-adapter",
                "black",
                "clj-kondo",
                "cmakelint",
                "cspell",
                "eslint_d",
                "firefox-debug-adapter",
                "go-debug-adapter",
                "hadolint",
                "isort",
                "jsonlint",
                "luacheck",
                "markdownlint",
                "mypy",
                "prettier",
                "pylint",
                "ruff",
                "shellcheck",
                "stylua",
                "tflint",
                "yamllint",
            },
        })
    end,
}
