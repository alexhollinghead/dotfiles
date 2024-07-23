-- Line numbering
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true

-- Folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- Tab Settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

--- Deindent
-- for command mode
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })
vim.keymap.set("n", "<Tab>", ">>", { noremap = true })

-- for insert mode
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })

-- Keymaps
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
