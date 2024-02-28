local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- Current Line
vim.cmd.highlight({ "CursorLine", "guibg=#2C2C2C" })

-- Blamer
vim.cmd.highlight({ "Blamer", "guifg=#696969" })

-- Diagnostics line background
vim.api.nvim_set_hl(0, "DiagnosticHintLn", { bg = "#1e1e3A" })
vim.api.nvim_set_hl(0, "DiagnosticInfoLn", { bg = "#1e1e3A" })
vim.api.nvim_set_hl(0, "DiagnosticWarnLn", { bg = "#2e2e20" })
vim.api.nvim_set_hl(0, "DiagnosticErrorLn", { bg = "#3A1e1e" })
vim.diagnostic.config({
    signs = { linehl = { "DiagnosticHintLn", "DiagnosticInfoLn", "DiagnosticWarnLn", "DiagnosticErrorLn" } },
})
