return {
	"willothy/moveline.nvim",
	build = "make",
	config = function()
		local function map(mode, l, r, desc, opts)
			opts = opts or {}
			opts.desc = desc or ""
			vim.keymap.set(mode, l, r, opts)
		end

		-- VSCode-like vertical line moving using Alt key
		local moveline = require("moveline")
		map({ "n", "i" }, "<M-k>", moveline.up, "Move line Up")
		map({ "n", "i" }, "<M-j>", moveline.down, "Move line Down")
		map({ "n", "i" }, "<M-Up>", moveline.up, "Move line Up")
		map({ "n", "i" }, "<M-Down>", moveline.down, "Move line Down")
		map("v", "<M-k>", moveline.block_up, "Move block Up")
		map("v", "<M-j>", moveline.block_down, "Move block Down")
		map("v", "<M-Up>", moveline.block_up, "Move block Up")
		map("v", "<M-Down>", moveline.block_down, "Move block Down")
	end,
}
