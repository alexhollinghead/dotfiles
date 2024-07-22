return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local configs = {
			require("mini.pairs").setup(),
			require("mini.comment").setup(),
		}
	end,
}
