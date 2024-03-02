return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        local fzf = require("fzf-lua")
        fzf.setup({})

        vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions, { desc = "[C]ode [A]ction" })
    end,
}
