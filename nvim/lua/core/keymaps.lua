-- Leader key
vim.g.mapleader = " "

-- Buffer management
vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", ":bn<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-h>", ":bp<CR>", { noremap = true, silent = true })

-- Indent/Deindent in normal mode
vim.keymap.set("n", "<Tab>", ">>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })

-- Deindent in insert mode
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })

-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { noremap = true, silent = true })
