return {
    'nvim-lualine/lualine.nvim',
    opts = {
        options = {
            icons_enabled = true,
            theme = 'horizon',
            component_separators = '|',
            section_separators = '',
        },
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'ryanoasis/vim-devicons'
    },
}