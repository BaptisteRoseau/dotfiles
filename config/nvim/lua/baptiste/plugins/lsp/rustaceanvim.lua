return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended according to README
	ft = { "rust", "rs" },
	config = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {
				code_actions = {
					ui_select_fallback = true,
				},
				auto_focus = true,
			},
			-- LSP configuration
			server = {
				on_attach = function(client, bufnr)
					-- Enable inlay hints
					vim.lsp.inlay_hint.enable(bufnr, true)

					-- Specific keymaps
					local keymap_set = function(mode, lhs, rhs, opts)
						opts.buffer = bufnr
						vim.keymap.set(mode, lhs, rhs, opts)
					end

					keymap_set("n", "<F5>", "<cmd>RustLsp debuggables<cr>", { desc = "Start Debugging Session" })
					keymap_set("n", "<F6>", "<cmd>RustLsp runnables<cr>", { desc = "Run Executables" })
					keymap_set("n", "<F7>", "<cmd>RustLsp testables<cr>", { desc = "Run Tests" })
					keymap_set(
						"n",
						"<leader>wc",
						"<cmd>RustLsp openCargo<cr>",
						{ desc = "[W]orkspace open [C]argo.toml" }
					)
					keymap_set(
						"n",
						"<leader>wC",
						"<cmd>RustLsp parentModule<cr>",
						{ desc = "[W]orkspace open parent [C]argo.toml" }
					)
					keymap_set("n", "<leader>ca", "<cmd>RustLsp codeAction<cr>", { desc = "Rust: [C]ode [A]ction" })
					keymap_set(
						"n",
						"<leader>ch",
						"<cmd>RustLsp hover action<cr>",
						{ desc = "Rust: [C]ode [H]over actions" }
					)
				end,
				settings = {
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
