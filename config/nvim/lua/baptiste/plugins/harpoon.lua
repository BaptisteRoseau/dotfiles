return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- set keymaps
        local keymap = vim.keymap

        keymap.set(
            "n",
            "<leader>Ha",
            "<cmd>lua require('harpoon.mark').add_file()<cr>",
            { desc = "[H]arpoon [A]dd file" }
        )
        keymap.set(
            "n",
            "<leader>Hr",
            "<cmd>lua require('harpoon.mark').rm_file()<cr>",
            { desc = "[H]arpoon [R]emove file" }
        )
        keymap.set("n", "<leader>Hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "[H]arpoon [N]ext mark" })
        keymap.set(
            "n",
            "<leader>Hp",
            "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
            { desc = "[H]arpoon [P]revious mark" }
        )
    end,
}
