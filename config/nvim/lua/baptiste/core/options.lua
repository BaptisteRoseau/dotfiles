-- Format On Save
-- With autosave enabled, this actually becomes anoying
-- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

local opt = vim.opt
local glob = vim.glob

-- ThePrimeagen
opt.nu = true
opt.relativenumber = false

-- Tabs configuration
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 12
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "90,120,+0"
opt.cursorline = true

opt.background = "dark"

opt.backspace = "indent,eol,start"

-- Set cursor to block in normal mode and bar in insert mode
opt.guicursor = "n-c-sm:block,i-ci-ve-v:ver25,r-cr-o:hor20"

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = "unnamedplus"

-- Enable break indent
opt.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Enable Blamer By default
glob.blamer_enabled = true

-- Recommended settings for auto-session
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
