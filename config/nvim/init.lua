vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: Autofill "replace" and find a workspace query-replace
-- TODO: Write my own cspell plugin
-- TODO: Fix <C-S-;> and <C-S-;> shortcuts
-- TODO: Add auto function-documentation plugin
-- TODO: Highlight current visual selection background as in VSCode
-- TODO: Pay for Copilot and add extension:
-- TODO: Populate workspace diagnostics linters
-- FIX: fix cspell diagnostics severity or write new plugin

-- When opening a directory with `nvim /path/to/directory`,
-- make CWD to be that directory. This fixes
-- Telescope's `find_files` to search within /path/to/directory
-- instead of the directory where the nvim command has been executed.
local arg = vim.fn.expand("%:p")
if vim.fn.isdirectory(arg) == 1 then
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_set_current_dir(arg)
end

require("baptiste.lazy")
require("baptiste.core")
