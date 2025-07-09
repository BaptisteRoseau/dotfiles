return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Useful status updates for LSP
        {
            "j-hui/fidget.nvim",
            opts = {},
        },
        "nvimtools/none-ls.nvim",

        -- Additional lua configuration, makes nvim stuff amazing!
        "folke/neodev.nvim",

        -- Run diagnostics on all workspace once when an LSP server is attached
        "artemave/workspace-diagnostics.nvim",
    },
    init_options = {
        userLanguages = {
            rust = "html",
        },
    },
    opts = {},
    config = function()
        local on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(bufnr, true)

            -- Run diagnostics on all workspace. This is actually ran only once.
            require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)

            local nmap = function(keys, func, desc)
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

            nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
            nmap("<F2>", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
            nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
            nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
            nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

            -- See `:help K` for why this keymap
            nmap("K", vim.lsp.buf.hover, "Hover Documentation")
            nmap("<C-s>", vim.lsp.buf.signature_help, "Signature Documentation")

            -- Lesser used LSP functionality
            nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
            nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
            nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
            nmap("<leader>wl", vim.lsp.buf.list_workspace_folders, "[W]orkspace [L]ist Folders")

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                vim.lsp.buf.format()
            end, { desc = "Format current buffer with LSP" })
        end

        -- document existing key chains
        require("which-key").add({
            {"<leader>b", group = "[B]uffer", mode = "n" },
            {"<leader>c", group = "[C]ode", mode = "n"},
            {"<leader>d", group = "[D]ocument", mode = "n"},
            {"<leader>g", group = "[G]it", mode = "n"},
            {"<leader>h", group = "Git [H]unk", mode = "n"},
            {"<leader>r", group = "[R]ename", mode = "n"},
            {"<leader>s", group = "[S]earch", mode = "n"},
            {"<leader>t", group = "[T]oggle", mode = "n"},
            {"<leader>w", group = "[W]orkspace", mode = "n"},
            {"<leader>i", group = "[I]DE", mode = "n"},
            --.add which-key VISUAL mode
            -- required for visual <leader>hs (hunk stage) to work
            {"<leader>", group = "VISUAL <leader>", mode = "v"},
            {"<leader>h", group = "Git [H]unk", mode = "v" },
        })
        -- mason-lspconfig requires that these setup functions are called in this order
        -- before setting up the servers.
        require("mason").setup()
        require("mason-lspconfig").setup()

        local servers = {
            bashls = { filetypes = { "sh" } },
            clangd = { filetypes = { "c", "h", "cpp", "hpp" } },
            dockerls = { filetypes = { "Dockerfile" } },
            html = { filetypes = { "html" } },
            jsonls = { filetypes = { "json" } },
            ltex = { filetypes = { "tex", "md" } },
            ruff = { filetypes = { "py" } },
            sqlls = { filetypes = { "sql" } },
            yamlls = { filetypes = { "yaml", "yml" } },
            lua_ls = {
                filetypes = { "lua" },
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    diagnostics = { disable = { "missing-fields" } },
                },
            },
        }

        -- Setup neovim lua configuration
        require("neodev").setup()

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = false,
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end,
        })
    end,
}
