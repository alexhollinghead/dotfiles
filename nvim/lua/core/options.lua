-- Enable 24-bit color (required by colorizer, virt-column, indent-blankline, etc.)
vim.opt.termguicolors = true

-- Line numbering
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }

-- Folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- Tab Settings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
