return {
	"preservim/tagbar",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>dt", "<cmd>TagbarToggle<cr>", { desc = "[D]ocument symbols [T]agbar" })
	end,
}
