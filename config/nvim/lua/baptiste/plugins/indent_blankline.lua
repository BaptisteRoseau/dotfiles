local highlight = {
    "CursorColumn",
}

return {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = {
        exclude = {
            buftypes = { "terminal", "nofile", "quickfix", "prompt" },
            filetypes = {
                "lspinfo",
                "packer",
                "checkhealth",
                "help",
                "man",
                "gitcommit",
                "TelescopePrompt",
                "TelescopeResults",
                "",
                "dashboard",
            },
        },
        whitespace = {
            highlight = highlight,
            remove_blankline_trail = false,
        },
        scope = { enabled = false },
        indent = { char = "▏" },
    },
}
