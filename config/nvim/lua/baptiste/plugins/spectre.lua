return {
    "nvim-pack/nvim-spectre",
    init = function()
        require("spectre").setup({
            highlight = {
                search = "DiffDelete",
                replace = "DiffAdd",
            },
        })

        vim.keymap.set("n", "<leader>ts", '<cmd>lua require("spectre").toggle()<CR>', {
            desc = "[T]oggle [S]pectre",
        })
        vim.keymap.set("n", "<C-h>", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Query replace current word",
        })
        vim.keymap.set("v", "<C-h>", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Query replace current word",
        })
        vim.keymap.set("n", "<C-f>", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Query replace current word on current file",
        })
    end,
}
