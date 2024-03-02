return {
    "davidmh/cspell.nvim",
    opts = {},
    config = function()
        local cspell = require("cspell")
        require("null-ls").setup({
            sources = {
                cspell.diagnostics,
                cspell.code_actions,
            },
        })
    end,
}
