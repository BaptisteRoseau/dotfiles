return {
	"Mofiqul/vscode.nvim",
	dependencies = {
		"lukas-reineke/indent-blankline.nvim",
	},
	opts = {},
	config = function()
		local vscode = require("vscode")
		vscode.setup({
			transparent = false,
			italic_comments = true,
			disable_nvimtree_bg = true,
			color_overrides = {
				-- See https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/colors.lua
				-- vscFront = '#3D3D3D'
			},
			group_overrides = {
				-- See https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/theme.lua
				Comment = { fg = "#606060", bg = "NONE" },
			},
		})
		vscode.load()
	end,
}
