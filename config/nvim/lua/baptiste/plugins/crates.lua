return {
	"saecki/crates.nvim",
	tag = "stable",
	config = function()
		require("crates").setup({
			on_attach = function(_)
				local crates = require("crates")
				vim.keymap.set("n", "<leader>Cr", crates.reload, { desc = "[C]rates [R]eload" })

				vim.keymap.set("n", "<leader>Cv", crates.show_versions_popup, { desc = "[C]rate [V]ersions" })
				vim.keymap.set("n", "<leader>Cf", crates.show_features_popup, { desc = "[C]rate [F]eatures" })
				vim.keymap.set("n", "<leader>Cd", crates.show_dependencies_popup, { desc = "[C]rate [D]ependencies" })

				vim.keymap.set("n", "<leader>Cu", crates.update_crate, { desc = "[C]rate [U]pdate" })
				vim.keymap.set("v", "<leader>Cu", crates.update_crates, { desc = "[C]rates [U]pdate" })
				vim.keymap.set("n", "<leader>Ca", crates.update_all_crates, { desc = "[C]rates update [A]ll" })
				vim.keymap.set("n", "<leader>CU", crates.upgrade_crate, { desc = "[C]rate [U]pgrade" })
				vim.keymap.set("v", "<leader>CU", crates.upgrade_crates, { desc = "[C]rates [U]pgrade" })
				vim.keymap.set("n", "<leader>CA", crates.upgrade_all_crates, { desc = "[C]rates upgrade [A]ll" })

				vim.keymap.set("n", "<leader>CH", crates.open_homepage, { desc = "[C]rate [H]omepage" })
				vim.keymap.set("n", "<leader>CR", crates.open_repository, { desc = "[C]rate [R]epository" })
				vim.keymap.set("n", "<leader>CD", crates.open_documentation, { desc = "[C]rate [D]documentation" })
				vim.keymap.set("n", "<leader>CC", crates.open_crates_io, { desc = "[C]rate open [C]rates.io" })
				require("which-key").add({
					["<leader>C"] = { name = "[C]rates", _ = "which_key_ignore" },
				})
			end,
		})
	end,
}
