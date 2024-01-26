return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'vscode',
        },
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'ryanoasis/vim-devicons'
    },
    priority = 100
}
