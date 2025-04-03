return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {},
    config = function()
        local keymap = vim.keymap
        local trouble = require("trouble")
        keymap.set("n", "<leader>tD", function()
            trouble.toggle()
        end, { desc = "[T]oogle [D]iagnostics" })

        keymap.set("n", "<leader>wD", function()
            trouble.toggle("workspace_diagnostics")
        end, { desc = "[W]orkspace [D]iagnostic" })
        keymap.set("n", "<leader>dD", function()
            trouble.toggle("document_diagnostics")
        end, { desc = "[D]ocument [D]iagnostic" })
        keymap.set("n", "<leader>qf", function()
            trouble.toggle("quickfix")
        end, { desc = "[Q]uick[F]ix diagnostic" })
        keymap.set("n", "gR", function()
            trouble.toggle("lsp_references")
        end, { desc = "[G]oto diagnostic [R]eference" })
        vim.keymap.set("n", "<leader>wt", "<cmd>TodoTrouble<cr>", { desc = "[W]orkspace [T]odos" })
    end,
}
