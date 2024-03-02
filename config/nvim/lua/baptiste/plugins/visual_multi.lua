-- Should be written BEFORE the plugin is initialized
-- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
-- See available mappings here:
-- vim.g.VM_maps = {}
-- vim.g.VM_maps["Find Under"] = "<C-d>"
-- vim.g.VM_maps["Find Subword Under"] = "<C-d>"
-- vim.g.VM_maps["Select Cursor Down"] = "<C-S-Down>"
-- vim.g.VM_maps["Select Cursor Up"] = "<C-S-Up>"
-- vim.g.VM_maps["Mouse Cursor"] = "<M-LeftMouse>"
-- vim.g.VM_maps["Select All"] = "<C-L>"
-- vim.g.VM_maps["Visual All"] = "<C-L>"
-- vim.g.VM_maps["Undo"] = "u"
-- vim.g.VM_maps["Redo"] = "<C-r>"
vim.g.VM_highlight_matches = "hi! Search cterm=NONE guibg=#303030"
vim.g.VM_theme = "codedark"

return {
    "mg979/vim-visual-multi",
    config = function() end,
}
