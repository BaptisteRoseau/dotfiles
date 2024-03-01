vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: Find or write a plugin to add special characters at the
-- begining and the end of a visual selection as in VSCode

-- When opening a directory with `nvim /path/to/directory`,
-- make CWD to be that directory. This fixes
-- Telescope's `find_files` to search within /path/to/directory
-- instead of the directory where the nvim command has been executed.
local arg = vim.fn.expand('%:p')
if vim.fn.isdirectory(arg) == 1 then
  vim.api.nvim_set_current_dir(arg)
end

require("baptiste.lazy")
require("baptiste.core")
