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
        require("which-key").add({
            { "<leader>bH",  desc = "[B]uffer [H]istory", mode = "n", _ = "which_key_ignore" },
            {"<leader>b", group = "[B]uffer", mode = "n" },
        })
    end,
}
