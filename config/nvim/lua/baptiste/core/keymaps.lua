local function map(mode, l, r, desc, opts)
    opts = opts or {}
    opts.desc = desc or ''
    vim.keymap.set(mode, l, r, opts)
end

map({ 'n', 'v' }, '<Space>', '<Nop>', '', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", '', { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", '', { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next diagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Open floating diagnostic message')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostics list')

-- Navigate thgough files
-- map('n', '<leader>ot', ':NERDTree<cr>', '[O]pen file [T]ree')

-- Indent In Visual Mode
map('v', '<Tab>', '>gv', 'Indent Right')
map('n', '<Tab>', '>>', 'Indent Right')
map('v', '<S-Tab>', '<gv', 'Indent Left')
map('n', '<S-Tab>', '<<', 'Indent Left')
