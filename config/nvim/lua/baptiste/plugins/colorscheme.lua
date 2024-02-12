return {
	"Mofiqul/vscode.nvim",
	dependencies = {
		"lukas-reineke/indent-blankline.nvim",
	},
	opts = {
		transparent = true,
		italic_comments = true,
		disable_nvimtree_bg = false,
		color_overrides = {
			-- See https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/colors.lua
			-- vscFront = '#3D3D3D'
		},
		group_overrides = {
			-- See https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/theme.lua
			Comment = { fg = "#707070", bg = "NONE" },
		},
	},
	config = function()
		require("vscode").load()
	end,
}
