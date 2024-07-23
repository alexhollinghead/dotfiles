return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local configs = {
			require("mini.comment").setup(),
			require("mini.move").setup(),
			require("mini.pairs").setup(),
			require("mini.surround").setup(),
		}
		return configs
	end,
}
