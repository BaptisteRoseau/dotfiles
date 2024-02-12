return {
	"APZelos/blamer.nvim",
	event = 'BufEnter',
	config = function ()
		vim.cmd.BlamerToggle()
	end
}
