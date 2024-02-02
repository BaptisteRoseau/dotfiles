return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			-- add = { text = "+" },
			-- change = { text = "~" },
			-- delete = { text = "_" },
			-- topdelete = { text = "‾" },
			-- changedelete = { text = "~" },
			add = { text = "|" },
			change = { text = "|" },
			delete = { text = "|" },
			topdelete = { text = "|" },
			changedelete = { text = "|" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map({ "n", "v" }, "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to next hunk" })

			map({ "n", "v" }, "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Jump to previous hunk" })

			-- Actions
			-- visual mode
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git [H]unk [S]tage" })
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git [H]unk R]eset" })
			-- normal mode
			map("n", "<leader>hs", gs.stage_hunk, { desc = "Git [H]unk [S]tage" })
			map("n", "<leader>hr", gs.reset_hunk, { desc = "Git [H]unk [R]eset" })
			map("n", "<leader>hS", gs.stage_buffer, { desc = "Git [H]unk [S]tage buffer" })
			map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git [H]unk [U]ndo stage" })
			map("n", "<leader>hR", gs.reset_buffer, { desc = "Git [H]unk [R]eset buffer" })
			map("n", "<leader>hp", gs.preview_hunk, { desc = "Git [H]unk [P]review" })
			map("n", "<leader>hb", function()
				gs.blame_line({ full = false })
			end, { desc = "git blame line" })
			map("n", "<leader>hd", gs.diffthis, { desc = "Git [H]unk [D]iff against index" })
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, { desc = "Git [H]unk [D]iff against last commit" })

			-- Toggles
			map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle git [B]lame line" })
			map("n", "<leader>td", gs.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select git hunk" })
		end,
	},
}
