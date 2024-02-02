return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"folke/neodev.nvim",
	},
	opts = {},
	config = function()
		require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })

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
        -- keymap.set("n", "<leader>id", dapui.toggle, { desc = "[I]DE toggle [D]ebug Interface" })
	end,
}

