return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended according to README
	ft = { "rust", "rs" },
	config = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
				on_attach = function(client, bufnr)
					-- you can also put keymaps in here
				end,
				settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
						},
						check_on_save = true,
					},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
