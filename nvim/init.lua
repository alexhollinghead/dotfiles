-- Setup Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Editor settings
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Load Plugins
require("lazy").setup("plugins", {})

-- Colorscheme managed by Themery plugin (:Themery to change themes)
