return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")
		-- TODO: Run diagnostics on all non-ignored files at startup

		lint.linters_by_ft = {
			ansible = { "ansible_lint" },
			bash = { "shellcheck" },
			c = { "clangtidy" },
			clojure = { "clj-kondo" },
			cmake = { "cmakelint" },
			cpp = { "cppcheck" },
			dockerfile = { "hadolint" },
			html = { "tidy" },
			inko = { "inko" },
			janet = { "janet" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			json = { "jsonlint" },
			lua = { "luacheck" },
			markdown = { "mardownlint" },
			python = { "pylint", "ruff", "mypy" },
			rst = { "vale" },
			ruby = { "ruby" },
			svelte = { "eslint_d" },
			terraform = { "tflint" },
			text = { "vale" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint" },
		}

		-- TODO: Make cspell always enabled
		local always_lint = { "cspell" }
		local do_lint = function()
			lint.try_lint()
			for _, linter_name in pairs(always_lint) do
				lint.try_lint(linter_name)
			end
		end

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = do_lint,
		})

		vim.keymap.set("n", "<leader>l", do_lint, { desc = "[L]int current file" })
	end,
}
