-- Should be written BEFORE the plugin is initialized
-- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
-- See available mappings here:
vim.g.VM_maps = {
    ["Find Under"] = "<C-d>",
    ["Find Subword Under"] = "<C-d>",
    ["Select Cursor Down"] = "<C-S-Down>",
    ["Select Cursor Up"] = "<C-S-Up>",
    ["Mouse Cursor"] = "<M-LeftMouse>",
    ["Select All"] = "<C-L>",
    ["Visual All"] = "<C-L>",
    ["Undo"] = "u",
    ["Redo"] = "<C-r>",
}
vim.g.VM_highlight_matches = "hi! Search cterm=NONE guibg=#303030"
vim.g.VM_theme = "codedark"

return {
    "mg979/vim-visual-multi",
    config = function() end,
}
