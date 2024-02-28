local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

-- TODO: Have red/yellow/blue undercurl for diagnostics instead of current fg

-- Current Line
vim.cmd.highlight({ "CursorLine", "guibg=#292929" })

-- Blamer
vim.cmd.highlight({ "Blamer", "guifg=#696969" })

-- Diagnostics line background
vim.api.nvim_set_hl(0, "DiagnosticErrorLn", { bg = "#3a1e1e" })
vim.api.nvim_set_hl(0, "DiagnosticWarnLn", { bg = "#3a3a1e" })
vim.api.nvim_set_hl(0, "DiagnosticInfoLn", { bg = "#1e1e3a" })
vim.api.nvim_set_hl(0, "DiagnosticHintLn", { bg = "#1e1e3a" })
vim.diagnostic.config({
    signs = { linehl = { "DiagnosticErrorLn", "DiagnosticWarnLn", "DiagnosticInfoLn", "DiagnosticHintLn" } },
})
