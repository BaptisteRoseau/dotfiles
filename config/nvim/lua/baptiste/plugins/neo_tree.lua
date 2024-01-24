return {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
        'ryanoasis/vim-devicons',
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    opts = {},
    config = function()
        vim.fn.sign_define("DiagnosticSignError",
            { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn",
            { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo",
            { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint",
            { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup({
            popup_border_style = "rounded",
            default_component_configs = {
                -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
                file_size = {
                    enabled = true,
                    required_width = 64, -- min width of window required to show this column
                },
                type = {
                    enabled = true,
                    required_width = 122, -- min width of window required to show this column
                },
                last_modified = {
                    enabled = true,
                    required_width = 88, -- min width of window required to show this column
                },
                created = {
                    enabled = true,
                    required_width = 110, -- min width of window required to show this column
                },
                symlink_target = {
                    enabled = true,
                },
            },
            filtered_items = {
                visible = true,                       -- when true, they will just be displayed differently than normal items
                force_visible_in_empty_folder = true, -- when true, hidden files will be shown if the root folder is otherwise empty
                show_hidden_count = true,             -- when true, the number of hidden items in each folder will be shown as the last entry
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            find_by_full_path_words = true,
            follow_current_file = {
                enabled = false,         -- This will find and focus the file in the active buffer every time
                -- the current file is changed while the tree is open.
                leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
        })
    end
}
