return {
    "wilfreddenton/history.nvim",
    opts = {},
    config = function()
        require("history").setup({
            keybinds = {
                back = "<M-Left>",
                forward = "<M-Right>",
                view = "<leader>bH",
            },
        })
        require("which-key").register({
            ["<leader>bH"] = { name = "[B]uffer [H]istory", _ = "which_key_ignore" },
            ["<leader>b"] = { name = "[B]uffer", _ = "which_key_ignore" },
        })
    end,
}
