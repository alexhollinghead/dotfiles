return {
	"preservim/vim-pencil",
	ft = { "markdown", "text", "tex" },
	config = function()
		vim.g["pencil#wrapModeDefault"] = "soft"
		vim.fn["pencil#init"]()
	end,
}
