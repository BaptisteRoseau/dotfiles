-- Format On Save
-- With autosave enabled, this actually becomes annoying
-- TODO: Be able to toggle this functionality
-- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

-- ThePrimeagen
vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "90,120,+0"
vim.opt.cursorline = true

vim.opt.background = "dark"

vim.opt.backspace = "indent,eol,start"

-- Set cursor to block in normal mode and bar in insert mode
vim.opt.guicursor = "n-c-sm:block,i-ci-ve-v:ver25,r-cr-o:hor20"

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this vim.opt.on if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt  have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Enable blamer by default
vim.g.blamer_enabled = true

-- Recommended settings for auto-session
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Attempt to enable opening URL and files using gx
vim.g.netrw_browsex_viewer = "open"
vim.g.netrw_mousemaps = 1

-- Auto reload on dirty
vim.opt.autoread = true
vim.opt.autowrite = true

vim.diagnostic.config({
    float = true,
    severity_sort = true,
})
