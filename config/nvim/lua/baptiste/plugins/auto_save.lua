return {
	"Pocco81/auto-save.nvim",
	opts = {},
	setup = function()
		vim.keymap.set("n", "<leader>ta", "<cmd>ASToggle<cr>", { desc = "[T]oogle [A]utosave" })
	end,
}
