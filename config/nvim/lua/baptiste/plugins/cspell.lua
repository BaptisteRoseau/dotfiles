return {
    "davidmh/cspell.nvim",
    opts = {},
    dependencies = {
        "nvimtools/none-ls.nvim",
    },
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
