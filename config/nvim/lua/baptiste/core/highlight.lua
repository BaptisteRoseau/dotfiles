local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Blamer
vim.cmd.highlight({ "Blamer", "guifg=#696969" })

-- Diagnostics line background
vim.api.nvim_set_hl(0, "DiagnosticHintLn", { bg = "#1e1e2e" })
vim.api.nvim_set_hl(0, "DiagnosticInfoLn", { bg = "#1e1e2e"})
vim.api.nvim_set_hl(0, "DiagnosticErrorLn", { bg ="#2e1e1e" })
vim.api.nvim_set_hl(0, "DiagnosticWarnLn", { bg = "#2e2e1e" })
vim.diagnostic.config({
	signs = { linehl = { "DiagnosticErrorLn", "DiagnosticWarnLn", "DiagnosticInfoLn", "DiagnosticHintLn" } },
})
