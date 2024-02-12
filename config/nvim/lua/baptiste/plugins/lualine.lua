return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ryanoasis/vim-devicons",
		"rmagatti/auto-session",
		"Mofiqul/vscode.nvim",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "vscode",
		},
		sections = { lualine_c = { require("auto-session.lib").current_session_name } },
	},
}
