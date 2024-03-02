return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "folke/neodev.nvim",
        "rcarriga/cmp-dap",
        "hrsh7th/nvim-cmp",
    },
    opts = {},
    config = function()
        require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })

        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            enabled = function()
                return require("cmp_dap").is_dap_buffer()
            end,
            sources = {
                { name = "dap" },
            },
        })
        -- Debugging icons
        local fn = vim.fn
        fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        fn.sign_define("DapBreakpointCondition", { text = "🟤", texthl = "", linehl = "", numhl = "" })
        fn.sign_define("DapBreakpointRejected", { text = "🟡", texthl = "", linehl = "", numhl = "" })
        fn.sign_define("DapLogPoint", { text = "🟣", texthl = "", linehl = "", numhl = "" })
        fn.sign_define("DapStopped", { text = "🔵", texthl = "", linehl = "", numhl = "" })

        -- VSCode-like debugger mapping
        local dap, dapui = require("dap"), require("dapui")
        local keymap = vim.keymap
        keymap.set("n", "<F5>", dap.continue)
        keymap.set("n", "<F10>", dap.step_over)
        keymap.set("n", "<F11>", dap.step_into)
        keymap.set("n", "<F12>", dap.step_out)
        keymap.set("n", "<leader>ib", dap.toggle_breakpoint, { desc = "[I]DE toggle [B]reakpoint" })
        keymap.set("n", "<leader>id", dapui.toggle, { desc = "[I]DE toggle [D]ebug Interface" })
    end,
}
