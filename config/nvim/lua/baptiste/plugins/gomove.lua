return {
    "booperlv/nvim-gomove",
    opts = {},
    config = function()
        require("gomove").setup({
            map_defaults = false,
            reindent = true,
            undojoin = true,
            move_past_end_col = true,
        })

        -- See https://github.com/booperlv/nvim-gomove?tab=readme-ov-file#mappings
        local map = vim.api.nvim_set_keymap

        map("n", "<M-h>", "<Plug>GoNSMLeft", {})
        map("n", "<M-j>", "<Plug>GoNSMDown", {})
        map("n", "<M-k>", "<Plug>GoNSMUp", {})
        map("n", "<M-l>", "<Plug>GoNSMRight", {})

        map("n", "<M-Down>", "<Plug>GoNSMDown", {})
        map("n", "<M-Up>", "<Plug>GoNSMUp", {})

        map("x", "<M-j>", "<Plug>GoVSMDown", {})
        map("x", "<M-h>", "<Plug>GoVSMLeft", {})
        map("x", "<M-k>", "<Plug>GoVSMUp", {})
        map("x", "<M-l>", "<Plug>GoVSMRight", {})

        map("x", "<M-Left>", "<Plug>GoVSMLeft", {})
        map("x", "<M-Down>", "<Plug>GoVSMDown", {})
        map("x", "<M-Up>", "<Plug>GoVSMUp", {})
        map("x", "<M-Right>", "<Plug>GoVSMRight", {})

        -- map("n", "<C-h>", "<Plug>GoNSDLeft", {})
        -- map("n", "<C-j>", "<Plug>GoNSDDown", {})
        -- map("n", "<C-k>", "<Plug>GoNSDUp", {})
        -- map("n", "<C-l>", "<Plug>GoNSDRight", {})
        --
        -- map("x", "<C-h>", "<Plug>GoVSDLeft", {})
        -- map("x", "<C-j>", "<Plug>GoVSDDown", {})
        -- map("x", "<C-k>", "<Plug>GoVSDUp", {})
        -- map("x", "<C-l>", "<Plug>GoVSDRight", {})
    end,
}
