return {
	"norcalli/nvim-colorizer.lua",
	opts = {},
	config = function()
		-- Required by this plugin
		vim.opt.termguicolors = true
		require("colorizer").setup()
	end,
}
