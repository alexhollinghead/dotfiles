vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "tex" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 80
	end,
})
