return {
    "nvim-neo-tree/neo-tree.nvim",
    priority = 40, -- Load before color scheme
    requires = {
        "ryanoasis/vim-devicons",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "s1n7ax/nvim-window-picker",
    },
    opts = {},
    config = function()
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })

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
            diagnostics = {
                symbols = {
                    hint = "󰌵",
                    info = "",
                    warn = "",
                    error = "",
                },
                highlights = {
                    hint = "DiagnosticSignHint",
                    info = "DiagnosticSignInfo",
                    warn = "DiagnosticSignWarn",
                    error = "DiagnosticSignError",
                },
            },
            indent = {
                indent_size = 1,
            },
            find_by_full_path_words = true,
            filesystem = {
                hijack_netrw_behavior = "open_default", -- open_default, open_current, disabled
                bind_to_cwd = true,
                filtered_items = {
                    visible = true, -- when true, they will just be displayed differently than normal items
                    force_visible_in_empty_folder = true, -- when true, shows hidden files if the root folder is empty
                    show_hidden_count = true, -- when true, shows the number of hidden items in each folder
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    leave_dirs_open = true, -- This will find and focus the file in the active buffer every time
                    -- the current file is changed while the tree is open.
                    enabled = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },
                never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                    ".DS_Store",
                    ".git",
                    "node_modules",
                },
            },
            git_status = {
                window = {
                    position = "float",
                    mappings = {
                        ["A"] = "git_add_all",
                        ["u"] = "git_unstage_file",
                        ["a"] = "git_add_file",
                        ["r"] = "git_revert_file",
                        ["c"] = "git_commit",
                        ["p"] = "git_push",
                        ["g"] = "git_commit_and_push",
                        ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                        ["oc"] = { "order_by_created", nowait = false },
                        ["od"] = { "order_by_diagnostics", nowait = false },
                        ["om"] = { "order_by_modified", nowait = false },
                        ["on"] = { "order_by_name", nowait = false },
                        ["os"] = { "order_by_size", nowait = false },
                        ["ot"] = { "order_by_type", nowait = false },
                    },
                },
            },
            -- Enable shortcuts starting with <space> when focusing on neotree window
            window = {
                mappings = {
                    ["<space>"] = false,
                },
            },
        })

        local keymap = vim.keymap
        keymap.set("n", "<leader>no", "<cmd>Neotree left filesystem<cr>", { desc = "[N]eotree [O]pen filesytem" })
        keymap.set("n", "<leader>nb", "<cmd>Neotree float buffers<cr>", { desc = "[N]eotree opened [B]uffers" })
        keymap.set("n", "<leader>ng", "<cmd>Neotree float git_status<cr>", { desc = "[N]eotree [G]it Status" })
        keymap.set("n", "<leader>nc", "<cmd>Neotree close<cr>", { desc = "[N]eotree [C]lose" })
        require("which-key").register({
            ["<leader>n"] = { name = "[N]eotree", _ = "which_key_ignore" },
        })
    end,
}
