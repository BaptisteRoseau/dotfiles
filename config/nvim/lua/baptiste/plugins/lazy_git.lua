return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
        require("telescope").load_extension("lazygit")
        vim.keymap.set("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "[G]it open [L]azyGit" })
        vim.keymap.set("n", "<leader>gH", "<cmd>LazyGitFilter<cr>", { desc = "[G]it workspace [H]istory" })
        vim.keymap.set("n", "<leader>gh", "<cmd>LazyGitFilterCurrentFile<cr>", { desc = "[G]it [H]istory" })
    end,
}
