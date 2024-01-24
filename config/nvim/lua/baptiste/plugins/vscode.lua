return {
    'Mofiqul/vscode.nvim',
    opts = {
        -- Alternatively set style in setup
        style = vim.opt.background,

        -- Transparent background
        transparent = true,

        -- Enable italic comment
        italic_comments = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
            -- vscFront = '#3D3D3D'
        },

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
            -- this supports the same val table as vim.api.nvim_set_hl
            -- use colors from this colorscheme by requiring vscode.colors!
            -- See https://github.com/Mofiqul/vscode.nvim/blob/main/lua/vscode/theme.lua
            -- NvimTreeIndentMarker              = { fg = "#FFFFFF", bg = 'NONE' }
        }
    },
    config = function()
        require('ibl').setup({
            whitespace = {
                highlight = { "Whitespace" },
                remove_blankline_trail = false
            },
            scope = { enabled = false },
        })
    end
}
