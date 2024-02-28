return {
    "mg979/vim-visual-multi",
    opts = {},
    config = function()
        -- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
        -- See available mappings here:
        -- FIXME: Make the visual multi command remap actually work
        vim.g.VM_maps["Find Under"] = "<C-d>"
        vim.g.VM_maps["Find Subword Under"] = "<C-d>"
        vim.g.VM_maps["Select Cursor Down"] = "<C-S-Down>"
        vim.g.VM_maps["Select Cursor Up"] = "<C-S-Up>"
        vim.g.VM_maps["Mouse Cursor"] = "<M-LeftMouse>"
        vim.g.VM_maps["Select All"] = "<C-L>"
        vim.g.VM_maps["Visual All"] = "<C-L>"
        vim.g.VM_maps["Undo"] = 'u'
        vim.g.VM_maps["Redo"] = '<C-r>'
    end,
}
