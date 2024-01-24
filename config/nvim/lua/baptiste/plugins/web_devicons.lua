return {
    'nvim-tree/nvim-web-devicons',
    dependencies = {
        'ryanoasis/vim-devicons'
    },
    opts = {
        color_icons = true,
        default = true,
        strict = true,
    },
    config = function()
        local web_devicon = require('nvim-web-devicons')
    end
}
