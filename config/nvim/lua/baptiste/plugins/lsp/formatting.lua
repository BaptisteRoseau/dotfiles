return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"
    conform.setup {
      formatters_by_ft = {
        bash = { "beautysh" },
        sh = { "beautysh" },
        css = { { "prettierd", "prettier" } },
        erb = { "htmlbeautifier" },
        graphql = { { "prettierd", "prettier" } },
        html = { "htmlbeautifier" },
        java = { "google-java-format" },
        javascript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        kotlin = { "ktlint" },
        lua = { "stylua" },
        markdown = { { "prettierd", "prettier" } },
        proto = { "buf" },
        python = { "isort", "black" },
        scss = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        yaml = { "yamlfix" },
      },
    }

    local format = function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end
    vim.keymap.set({ "n", "v" }, "<leader>ff", format, { desc = "[F]ormat [F]ile or range (in visual mode)" })
    vim.keymap.set({ "n", "v" }, "<C-S-i>", format, { desc = "[F]ormat [F]ile or range (in visual mode)" })

    require("which-key").add {
      {"<leader>f", group = "[F]ormat", mode = "n"},
    }
  end,
}
