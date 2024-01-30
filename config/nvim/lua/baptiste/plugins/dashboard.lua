return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "vsoce",
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
