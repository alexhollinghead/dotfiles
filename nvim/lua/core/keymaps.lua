-- Leader key
vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>d", vim.cmd.Ex)

-- Buffer management
vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })

-- Indent/Deindent in normal mode
vim.keymap.set("n", "<Tab>", ">>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })

-- Deindent in insert mode
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })
