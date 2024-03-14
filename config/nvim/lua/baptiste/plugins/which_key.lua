return {
	-- Useful plugin to show you pending keybindings.
	"folke/which-key.nvim",
	opts = {},
	priority = 10,
	config = function ()
		vim.keymap.set("n", "<leader>k", "<cmd>WhichKey<cr>", {desc = "[K]eybindings"})
	end
}

