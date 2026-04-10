return {
	"xiyaowong/virtcolumn.nvim",
	event = "BufReadPost",
	config = function()
		vim.g.virtcolumn_priority = 0 -- priority of extmark
	end,
}
