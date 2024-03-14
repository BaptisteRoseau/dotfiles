return {
    "Pocco81/auto-save.nvim",
    opts = {
        condition = function(buf)
            -- Verify the buffer comes from a file and is valid before saving
            local utils = require("auto-save.utils.data")
            return vim.fn.getbufvar(buf, "&modifiable") == 1
                and utils.not_in(vim.fn.getbufvar(buf, "&filetype"), {})
                and #vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) > 0
        end,
    },
    init = function()
        vim.keymap.set("n", "<leader>ta", "<cmd>ASToggle<cr>", { desc = "[T]oogle [A]utosave" })
    end,
}
