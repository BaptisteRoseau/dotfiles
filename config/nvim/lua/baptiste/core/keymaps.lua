local function map(mode, l, r, desc, opts)
    opts = opts or {}
    opts.desc = desc or ""
    vim.keymap.set(mode, l, r, opts)
end

map({ "n", "v" }, "<Space>", "<Nop>", "", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", "", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", "", { expr = true, silent = true })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
map("n", "<leader>cd", vim.diagnostic.open_float, "[C]ode [D]iagnostic window")

-- New buffers
map("n", "<leader>bn", "<cmd>e new<cr>", "[B]uffer [N]ew")
map("n", "<leader>bv", "<cmd>vs new<cr>", "[B]uffer [V]ertical new")
map("n", "<leader>bh", "<cmd>sp new<cr>", "[B]uffer [H]orizontal new")

-- Navigating with insert mode
map("i", "<C-h>", "<Left>", "Move cursor left")
map("i", "<C-j>", "<Down>", "Move cursor down")
map("i", "<C-k>", "<Up>", "Move cursor up")
map("i", "<C-l>", "<Right>", "Move cursor right")

-- Tabs Management
map("n", "<C-t>", "<cmd>tabnew<cr>", "Create a new tab")

-- VSCode commenting shortcuts
map("n", "<C-S-:>", "gcc", "Comment line")
map("x", "<C-S-:>", "gc", "Comment area")

-- Indent In Normal and Visual Mode
map("v", "<Tab>", ">gv", "Indent Right")
map("n", "<Tab>", ">>", "Indent Right")
map("v", "<S-Tab>", "<gv", "Indent Left")
map("n", "<S-Tab>", "<<", "Indent Left")

-- Quick quit
map("n", "<C-M-q>", "<cmd>qa<cr>", "Quick Quit")
map("n", "<C-M-S-q>", "<cmd>qa!<cr>", "Quick Quit Force Force")

-- File path and name copy utils
local function get_path(mods)
    ---@diagnostic disable-next-line: param-type-mismatch
    return vim.fn.fnamemodify(vim.fn.expand("%"), mods)
end

map("n", "<leader>dp", function()
    vim.fn.setreg("+", (get_path(":.")))
end, "[D]ocument [P]ath (rel)")

map("n", "<leader>dP", function()
    vim.fn.setreg("+", (get_path(":p")))
end, "[D]ocument [P]ath (abs)")

map("n", "<leader>df", function()
    vim.fn.setreg("+", (get_path(":t")))
end, "[D]ocument [F]ilename")
