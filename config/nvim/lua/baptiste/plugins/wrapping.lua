return {
    "andrewferrier/wrapping.nvim",
    config = function()
        local wrapping = require("wrapping")
        wrapping.setup({
            {
                create_commands = false,
                create_keymaps = false,
                auto_set_mode_filetype_allowlist = {
                    "asciidoc",
                    "gitcommit",
                    "latex",
                    "mail",
                    "markdown",
                    "rst",
                    "tex",
                    "text",
                },
            },
        })

        vim.keymap.set({ "n", "i", "x" }, "<M-z>", require("wrapping").toggle_wrap_mode, { desc = "Toggle Word Wrap" })
    end,
}
